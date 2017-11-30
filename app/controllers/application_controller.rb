require './config/environment'
require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
     set :views, 'app/views'
     enable :sessions
     use Rack::Flash
     set :session_secret, "password_security"
  end

  get "/" do
  	@order = Order.find_or_create_by(params[:order_id])
  	binding.pry
    erb :create_order
  end

  post "/uploads" do 
  		#raise params.inspect
  		@order = Order.find_or_create_by(params[:order_id])
		@filename = params[:file][:filename]
  		file = params[:file][:tempfile]
  		@upload = Upload.new
  		@upload.image_url = @filename
  		@upload.order = @order 
  		@upload.title = params[:title]
  		@upload.save
  		
  		File.open("./public/uploads/#{@filename}", 'wb') do |f|
    		f.write(file.read)
  		end
  		binding.pry
	  redirect "/orders/#{@order.id}"
      flash[:message] = "Successfully created order."
  end

  get '/orders/:id'do
    # if logged_in?
      #@user = User.find(session[:user_id])
      @order =Order.find_by_id(params[:id])
        # if @order.user.id == current_user.id
        #   @orders = current_user.orders
        #   flash[:message] = "You are logged in to view an order."
          erb :'/show_order'
        # else
        #   redirect to '/orders'
        # end
    # else 
    #   flash[:message] = "You must be logged in to view a order."
    #   redirect to '/login'
    # end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id]) 
      end
    end
  end

end

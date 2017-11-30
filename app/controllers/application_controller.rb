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
    erb :create_order
  end

  post "/uploads" do 
  		raise params.inspect
  		@order = Order.find_by_id(params[:order_id])
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

		redirect "/categories/#{@order.id}"

  end


end

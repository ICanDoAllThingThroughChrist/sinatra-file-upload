class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
  		t.string "title"
    	t.integer "order_id"
    	t.string :image_url
      t.timestamps null: false
    end
  end
end

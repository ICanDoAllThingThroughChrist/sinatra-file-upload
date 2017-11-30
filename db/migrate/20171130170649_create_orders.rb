class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    t.integer "client_id"
    t.integer "comment_id"
    t.integer "frequency_id"
    t.integer "site_id"
    t.integer "task_id"
    t.string "counter"
    t.integer "user_id"
    t.integer "status_id"
    t.datetime "created_date"
    t.datetime "updated_date"
    t.string "upload_id"
    t.string "title"
    t.timestamps null: false
    end
  end
end

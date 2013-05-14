# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130509172152) do

  create_table "adjustments", :force => true do |t|
    t.decimal   "pay"
    t.decimal   "leave"
    t.integer   "paycheck_id"
    t.integer   "user_id"
    t.integer   "note_id"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.string    "note"
  end

  create_table "cost_centers", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "employees", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at",                       :null => false
    t.timestamp "updated_at",                       :null => false
    t.integer   "payrate_id"
    t.string    "status",          :default => "A"
    t.date      "datedeactivated"
  end

  create_table "leaves", :force => true do |t|
    t.timestamp "start_at"
    t.timestamp "end_at"
    t.integer   "employee_id"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.string    "note"
  end

  create_table "menu_items", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "notes", :force => true do |t|
    t.integer   "user_id"
    t.string    "content"
    t.integer   "adjustment_id"
    t.timestamp "created_at",    :null => false
    t.timestamp "updated_at",    :null => false
  end

  create_table "notes_pay_rates", :force => true do |t|
    t.integer   "note_id"
    t.integer   "payrate_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "notes_paychecks", :force => true do |t|
    t.integer   "note_id"
    t.integer   "paycheck_id"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  create_table "order_items", :force => true do |t|
    t.integer   "menu_item_id"
    t.integer   "ticket_id"
    t.timestamp "created_at",   :null => false
    t.timestamp "updated_at",   :null => false
  end

  create_table "pay_rates", :force => true do |t|
    t.string    "type"
    t.string    "name"
    t.decimal   "hourly_rate"
    t.decimal   "monthly_rate"
    t.decimal   "FTE"
    t.timestamp "created_at",     :null => false
    t.timestamp "updated_at",     :null => false
    t.boolean   "monthly"
    t.integer   "cost_center_id"
  end

  create_table "paychecks", :force => true do |t|
    t.timestamp "start_at"
    t.timestamp "end_at"
    t.string    "status"
    t.timestamp "prepared_at"
    t.timestamp "delivered_at"
    t.integer   "employee_id"
    t.integer   "payrate_id"
    t.integer   "user_id"
    t.timestamp "created_at",              :null => false
    t.timestamp "updated_at",              :null => false
    t.decimal   "fte"
    t.decimal   "total_adjustments_pay"
    t.decimal   "total_adjustments_leave"
    t.integer   "total_hours"
    t.decimal   "total_leave"
    t.decimal   "total_leave_taken"
    t.decimal   "total_leave_balance"
    t.decimal   "total_pay"
  end

  create_table "tickets", :force => true do |t|
    t.integer   "table_number"
    t.string    "name"
    t.timestamp "created_at",   :null => false
    t.timestamp "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "name"
    t.string    "encrypted_password"
    t.integer   "employee_id"
    t.timestamp "created_at",         :null => false
    t.timestamp "updated_at",         :null => false
  end

  create_table "worked_shifts", :force => true do |t|
    t.timestamp "start_at"
    t.timestamp "end_at"
    t.integer   "employee_id"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

end

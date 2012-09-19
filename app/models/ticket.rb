class Ticket < ActiveRecord::Base
  has_many :order_items

  attr_accessible :name, :table_number

  def to_s
    "Table #{table_number}"
  end
end

class OrderItem < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :ticket

  attr_accessible :menu_item_id, :ticket_id

  validates :menu_item,  presence: true
  validates :ticket,     presence: true

  def to_s
    menu_item
  end
end

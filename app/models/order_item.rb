class OrderItem < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :ticket

  attr_accessible :menu_item_id, :ticket_id

  validate :menu_item, presence: true
  validate :ticket, presence: true

  def to_s
    menu_item
  end
end

class OrderItemsController < ApplicationController
  respond_to :html

  expose(:ticket)
  expose(:menu_items)
  expose(:order_items, ancestor: :ticket)
  expose(:order_item)

  def create
    order_item.save

    respond_with order_item, location: ticket
  end
end
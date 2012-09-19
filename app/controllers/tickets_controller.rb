class TicketsController < ApplicationController
  respond_to :html

  expose(:tickets)
  expose(:ticket)

  def create
    ticket.save

    respond_with ticket, location: tickets_path
  end
end
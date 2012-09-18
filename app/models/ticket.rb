class Ticket < ActiveRecord::Base
  attr_accessible :name, :table_number

  def to_s
    "Table #{table_number}"
  end
end

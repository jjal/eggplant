class MenuItem < ActiveRecord::Base
  attr_accessible :name

  validate :name, presence: true

  def to_s
    name
  end
end

class MenuItem < ActiveRecord::Base
  attr_accessible :name

  validate :name, presence: true
end

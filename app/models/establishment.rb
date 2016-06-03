class Establishment < ActiveRecord::Base
  validates_presence_of :name, :address_1, :city, :state, :zip

  has_many :favorites
end

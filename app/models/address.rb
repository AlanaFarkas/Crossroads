class Address < ActiveRecord::Base
  validates_presence_of :address_1, :city, :state, :zip

  belongs_to :user
end

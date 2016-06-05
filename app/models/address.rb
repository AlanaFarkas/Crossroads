class Address < ActiveRecord::Base
  validates_presence_of :address_1, :city, :state, :zip

  belongs_to :user

  def full_address
  	"#{self.address_1} #{self.city} #{self.state} #{self.zip}"
  end

  ADDRESS_TYPES = ["Home", "Work"]

end

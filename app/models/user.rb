class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validates_format_of :email,  with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :password, within: 6..25, too_long: 'cannot be over 25 characters', too_short: 'must be at least 6 characters'

  has_secure_password
  has_many :addresses
  has_many :favorites
end

class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validates_format_of :email,  with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :password, within: 6..25, too_long: 'cannot be over 25 characters', too_short: 'must be at least 6 characters'
  validates_format_of :password, with: /^.(?=.{6,})(?=.[a-z])(?=.[A-Z])(?=.[\d\W]).*$/, message: 'must have at least one digit and one capital letter'

  has_many :addresses
  has_many :favorites
end

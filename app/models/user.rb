class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validates_format_of :email,  with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :password, within: 6..25, too_long: 'cannot be over 25 characters', too_short: 'must be at least 6 characters'

  has_many :addresses
  has_many :favorites

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      first_name = data["name"].split(" ").shift
      last_name  = data["name"].split(" ").pop
        user = User.create(first_name: first_name,
                           last_name: last_name,
                           email: data["email"],
                           password: Devise.friendly_token[0,20]
                          )
    end
    user
  end

end

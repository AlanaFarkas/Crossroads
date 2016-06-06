class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  validates_presence_of :first_name, :last_name, :email
  # validates_uniqueness_of :email
  validates_format_of :password,  with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./, message: "must contain at least one capital letter and a digit"
  validates_length_of :password, within: 6..25, too_long: 'cannot be over 25 characters', too_short: 'must be at least 6 characters'

  has_many :addresses
  has_many :favorites
  has_many :favorited_establishments, through: :favorites, source: :establishment

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      first_name = data["name"].split(" ").shift
      last_name  = data["name"].split(" ").pop
        user = User.create(uid: access_token.uid,
                           first_name: first_name,
                           last_name: last_name,
                           email: data["email"],
                           password: Devise.friendly_token[0,20]
                          )
    end
    user
  end


end

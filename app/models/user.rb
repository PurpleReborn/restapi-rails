class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: URI::MailTo::EMAIL_REGEXP

  has_one :user_profile, dependent: :destroy
  
  # has_many :access_tokens,
  #           class_name: 'Doorkeeper::AccessTokens',
  #           foreign_key: :resource_owner_id,
  #           dependent: :delete_all

  accepts_nested_attributes_for :user_profile
  
  # the authenticate method from devise documentation
  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end
end

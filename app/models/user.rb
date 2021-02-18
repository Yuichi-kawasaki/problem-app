class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i(twitter)
  attr_accessor:remember_token

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :city,  presence: true
  validates :gender, presence: true
  validates :prefecture,  presence: true
  validates :profession, presence: true

  validates :profile, presence: true


  has_many :problems, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader

  def User.digest(string)
   cost = ActiveModel::SecurePassword.min_cost ? Bcrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
   BCrypt::Password.create(string, cost: cost)
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_twitter(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.new(email: auth.info.email,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                                   )
    end
    user.save
    user
  end

  # def remember
  #  self.remember_token = User.new_token
  #  update_attribute(:remember_digest,User.digest(remember_token))
  # end
end

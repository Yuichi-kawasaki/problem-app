class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(facebook twitter)
    # validates :city,  presence: true
    # validates :prefecture, presence: true
  #   before_validation { email.downcase! }
    has_many :problems, dependent: :destroy
  #   # has_many :favorites, dependent: :destroy
    mount_uploader :image, ImageUploader
    # def User.new_token
    #  SecureRandom::urlsafe_base64
    # end
    #
    # def remember
    #  self.remember_token = User.new_token
    #  update_attribute(:remember_digest,User.digest(remember_token))
    # end
    # def self.generate_password
    #   SecureRandom.hex(10)
    # end
  # def self.create_unique_string
  #   SecureRandom.uuid
  # end
  def self.find_or_create_by_email(email)
    user = find_or_initialize_by(email: email)
    if user.new_record?
      user.password = generate_password
      user.save!
      AssignMailer.assign_mail(user.email, user.password).deliver
    end
    user
  end

  def self.generate_password
    SecureRandom.hex(10)
  end


  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
  end
end
  #   def self.find_for_facebook(auth)
  #   user = User.find_by(email: auth.info.email)
  #   unless user
  #     user = User.new(email: auth.info.email,
  #                     provider: auth.provider,
  #                     uid:      auth.uid,
  #                     password: Devise.friendly_token[0, 20],
  #                                )
  #   end
  #   user.save
  #   user
  # end
  #   def self.find_for_twitter(auth)
  #   user = User.find_by(email: auth.info.email)
  #   unless user
  #     user = User.new(email: auth.info.email,
  #                     provider: auth.provider,
  #                     uid:      auth.uid,
  #                     password: Devise.friendly_token[0, 20],
  #                                )
  #   end
  #   user.save
  #   user
  # end
end

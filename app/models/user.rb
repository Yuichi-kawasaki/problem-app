class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(facebook twitter)
    # validates :city,  presence: true
    # validates :prefecture, presence: true
  #   before_validation { email.downcase! }
    has_many :active_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
    has_many :followings, through: :active_relationships, source: :followed
    has_many :passive_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower
    has_many :problems, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_problems, through: :likes, source: :problem
    mount_uploader :image, ImageUploader

    has_many :social_profiles, dependent: :destroy
      #...

      TEMP_EMAIL_PREFIX = 'change@me'
      TEMP_EMAIL_REGEX = /\Achange@me/

      # emailの登録状況を判定するカスタムvalidatorを使用するためのおまじない。
      validates :email, presence: true, email: true


      def social_profile(provider)
        social_profiles.select{ |sp| sp.provider == provider.to_s }.first
      end

      # 本物のemailがセットされているか確認。
      def email_verified?
        self.email && self.email !~ TEMP_EMAIL_REGEX
      end

      # email確認がされていない状態にする。
      def reset_confirmation!
        self.update_column(:confirmed_at, nil)
      end

      # Userモデル経由でcurrent_userを参照できるようにする。
      def self.current_user=(user)
        # Set current user in Thread.
        Thread.current[:current_user] = user
      end

      # Userモデル経由でcurrent_userを参照する。
      def self.current_user
        # Get current user from Thread.
        Thread.current[:current_user]
      end

      def already_liked?(problem)
        self.likes.exists?(problem_id: problem.id)
      end

      def following?(other_user)
        active_relationships.find_by(followed_id: other_user.id)
      end

      def follow!(other_user)
        active_relationships.create!(followed_id: other_user.id)
      end

      def unfollow!(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
      end

      def matchers
        followings & followers
      end

      private

      def admin_authorization
      end

      def admin_zero
        if User.where(admin: true).length == 1 && self.admin?
          throw(:abort)
        end
      end
end
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
#   def self.find_or_create_by_email(email)
#     user = find_or_initialize_by(email: email)
#     if user.new_record?
#       user.password = generate_password
#       user.save!
#       AssignMailer.assign_mail(user.email, user.password).deliver
#     end
#     user
#   end
#
#   def self.generate_password
#     SecureRandom.hex(10)
#   end
#
#
#   def self.from_omniauth(auth)
#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#     user.email = auth.info.email
#     user.password = Devise.friendly_token[0,20]
#   end
# end
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

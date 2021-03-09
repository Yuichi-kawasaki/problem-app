class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable
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
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    has_many :social_profiles, dependent: :destroy
      #...

      # TEMP_EMAIL_PREFIX = 'change@me'
      # TEMP_EMAIL_REGEX = /\Achange@me/

      # emailの登録状況を判定するカスタムvalidatorを使用するためのおまじない。
      # validates :email, presence: true, email: true


      def social_profile(provider)
        social_profiles.select{ |sp| sp.provider == provider.to_s }.first
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

class Problem < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, length: {maximum: 30}
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
end

class Problem < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, length: {maximum: 30}
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

  scope :get_by_title, -> (title) {
  where('title LIKE ?', "%#{ title }%")
  }
  scope :get_by_labels_id, -> (label){
  where('id LIKE?', "%#{title}%")
  }
end

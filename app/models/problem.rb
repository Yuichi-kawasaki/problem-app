class Problem < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, length: {maximum: 30}
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

  # scope :title_like, -> (title) {
  # where('title LIKE ?', "%#{params[:title]}%")
  # }
  scope :labels_id_like, -> (label_id){
  where('label_id LIKE?', "%#{title}%")
  }
end

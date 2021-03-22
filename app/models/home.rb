class Home < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

  default_scope -> { order(created_at: :desc) }

  scope :search, -> (search_params) do
    return if search_params.blank?
      title_like(search_params[:title])
   end

  scope :title_like, -> (title) {
  where('title LIKE ?', "%#{title}%")
  }
  scope :labels_id_like, -> (label_id){
  where('label_id LIKE?', "%#{title}%")
  }

end

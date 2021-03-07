class Problem < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: {maximum: 30}
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

  def self.latest(number)
    order(created_at: :desc).limit(number)
  end

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

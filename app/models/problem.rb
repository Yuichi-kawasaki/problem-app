class Problem < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, length: {maximum: 30}

end

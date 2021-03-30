class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :problem
  validates :content, presence: true, length: {maximum: 30}
end

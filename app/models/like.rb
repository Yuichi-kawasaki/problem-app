class Like < ApplicationRecord
  belongs_to :problem
  belongs_to :user
  validates_uniqueness_of :problem_id, scope: :user_id
end

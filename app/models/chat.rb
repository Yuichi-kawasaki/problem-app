class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :message, presence: true, length: {maximum: 20}
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end

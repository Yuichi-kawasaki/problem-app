class Problem < ApplicationRecord
  validates :title, length: {maximum: 30}

end

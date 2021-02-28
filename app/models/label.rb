class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :problems, through: :labellings
end

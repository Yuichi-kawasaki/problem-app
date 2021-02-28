class Labelling < ApplicationRecord
  belongs_to :problem, optional: true
  belongs_to :label, optional: true
end

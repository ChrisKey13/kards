class Goal < ApplicationRecord
  belongs_to :mesure
  validates :date, presence: :true
  validates :recurrence, presence: :true
end

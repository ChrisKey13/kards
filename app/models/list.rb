class List < ApplicationRecord
  has_many :flashcards, dependent: :destroy
  belongs_to :goal
  belongs_to :language
  validates :goal, absence: true
end

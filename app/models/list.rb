class List < ApplicationRecord
  has_many :flashcards, dependent: :destroy
  belongs_to :language
end

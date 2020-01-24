class Flashcard < ApplicationRecord
  belongs_to :status
  belongs_to :list
end

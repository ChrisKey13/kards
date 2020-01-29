class Flashcard < ApplicationRecord
  belongs_to :list
  validates :title, presence: :true
  validates :content, presence: :true
  validates :solution, presence: :true
  validates :answer, absence: :true
  has_one_attached :photo


end

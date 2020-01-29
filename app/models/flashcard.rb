class Flashcard < ApplicationRecord
  belongs_to :list
  validates :title, presence: :true, uniqueness: :true
  validates :content, presence: :true
  validates :solution, presence: :true
  validates :answer, absence: :true
  has_many_attached :photos


end

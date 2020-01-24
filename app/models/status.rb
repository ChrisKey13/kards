class Status < ApplicationRecord
  STATUS = ['Not Mastered Yet', 'Mastered']
  has_many :flashcards
  validates :type, inclusion: { in: STATUS }
end

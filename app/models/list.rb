class List < ApplicationRecord
  has_many :flashcards, dependent: :destroy
  belongs_to :language
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }
  def self.perform_search(keyword)
    if keyword.present?
    then List.search(keyword)
    else List.all
    end.sorted
  end
end

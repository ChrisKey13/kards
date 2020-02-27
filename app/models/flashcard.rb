class Flashcard < ApplicationRecord
  belongs_to :list
  validates :question, presence: :true
  validates :solution, presence: :true
  has_one_attached :photo
  after_initialize :set_defaults

  def self.upload(photo)
    Cloudinary::Uploader.upload(photo)
  end

  def self.perform_search(keyword)
    if keyword.present?
    then Flashcard.search(keyword)
    else Flashcard.all
    end.sorted
  end

  def set_defaults
    self.status = "Not Mastered Yet" if self.new_record?
  end
end

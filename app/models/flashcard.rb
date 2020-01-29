class Flashcard < ApplicationRecord
  belongs_to :list
  validates :title, presence: :true
  validates :content, presence: :true
  validates :solution, presence: :true
  validates :answer, absence: :true
  has_one_attached :photo


  def self.upload(photo)
    Cloudinary::Uploader.upload(photo)
  end

  def self.perform_search(keyword)
    if keyword.present?
    then Flashcard.search(keyword)
    else Flashcard.all
    end.sorted
  end

end

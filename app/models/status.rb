class Status < ApplicationRecord
  has_many :flascards
  STATUS = ["Not Mastered Yet", "Mastered"]
  validates :name, inclusion: { in: STATUS }
end

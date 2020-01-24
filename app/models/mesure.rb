class Mesure < ApplicationRecord
  MESURES = ['Day', 'Week', 'Month', 'Year']
  has_many :goals, dependent: :destroy
  validates :name, inclusion: { in: MESURES }
end

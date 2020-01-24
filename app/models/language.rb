class Language < ApplicationRecord
    LANGUAGES = ['Dart', 'Elixir', 'Go','Javascript', 'Python', 'Ruby']
    has_many :lists, dependent: :destroy
    validates :name, inclusion: { in: LANGUAGES }
end

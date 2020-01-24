class AddStatusToFlashcards < ActiveRecord::Migration[6.0]
  def change
    add_column :flashcards, :status, :string, default: 'Not Mastered Yet', null: false
  end
end

class CreateFlashcards < ActiveRecord::Migration[6.0]
  def change
    create_table :flashcards do |t|
      t.string :question
      t.string :solution
      t.string :code
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.date :date
      t.string :recurrence
      t.references :mesure, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.references :winner, references: :fighters, optional: true
      t.references :loser, references: :fighters, optional: true

      t.timestamps
    end
  end
end

class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.references :winner, references: :fighters
      t.references :loser, references: :fighters

      t.timestamps
    end
  end
end

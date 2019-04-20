class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.references :winner, references: :fighters, optional: true
      t.references :loser, references: :fighters, optional: true
      t.references :fighter_1, references: :fighters
      t.references :fighter_2, references: :fighters
      t.references :equipement_1, references: :equipements
      t.references :equipement_2, references: :equipements

      t.timestamps
    end
  end
end

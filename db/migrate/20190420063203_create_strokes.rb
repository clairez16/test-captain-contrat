class CreateStrokes < ActiveRecord::Migration[5.2]
  def change
    create_table :strokes do |t|
      t.references :fight
      t.references :owner, references: :fight_fighters
      t.references :target, references: :fight_fighters
      t.references :attack_equipement, references: :equipements
      t.references :defense_equipement, references: :equipements
      t.integer :impact, default: 0
      t.boolean :missed, default: false

      t.timestamps
    end
  end
end

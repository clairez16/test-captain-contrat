class CreateEquipements < ActiveRecord::Migration[5.2]
  def change
    create_table :equipements do |t|
      t.string :name
      t.string :photo
      t.integer :attack_points, default: 0
      t.integer :defense_points, default: 0
      t.integer :hands
      t.timestamps
    end
  end
end

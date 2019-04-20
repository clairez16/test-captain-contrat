class CreateFighterEquipements < ActiveRecord::Migration[5.2]
  def change
    create_table :fighter_equipements do |t|
      t.references :equipement
      t.references :fighter

      t.timestamps
    end
  end
end

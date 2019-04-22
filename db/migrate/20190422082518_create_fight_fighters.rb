class CreateFightFighters < ActiveRecord::Migration[5.2]
  def change
    create_table :fight_fighters do |t|
      t.references :fight
      t.references :fighter
      t.references :equipement

      t.timestamps
    end
  end
end

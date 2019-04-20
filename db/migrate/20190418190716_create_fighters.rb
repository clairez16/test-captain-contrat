class CreateFighters < ActiveRecord::Migration[5.2]
  def change
    create_table :fighters do |t|
      t.string :name
      t.string :photo
      t.integer :category, default: 0
      t.integer :life_points
      t.integer :attack_points
      t.integer :experience, default: 0
      t.integer :level, default: 0
      t.timestamps
    end
  end
end

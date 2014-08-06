class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.string :name
      t.string :slug
      t.integer :rate
      t.integer :skill_category_id

      t.timestamps
    end

    add_index :skills, :skill_categoty_id
  end

  def self.down
    drop_table :skills
  end
end

class CreateExperiences < ActiveRecord::Migration
  def self.up
    create_table :experiences do |t|
      t.integer :project_id
      t.integer :skill_id
      t.integer :person_id
      t.integer :rate
      t.integer :days
      t.text :description

      t.timestamps
    end

    add_index :experiences, :project_id
    add_index :experiences, :skill_id
    add_index :experiences, :person_id
  end

  def self.down
    drop_table :experiences
  end
end

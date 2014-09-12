class CreateExperiences < ActiveRecord::Migration
  def self.up
    create_table :experiences do |t|
      t.integer :assignment_id
      t.integer :skill_id
      t.integer :person_id
      t.integer :rate
      t.integer :days
      t.text :description

      t.timestamps
    end

    add_index :experiences, :assignment_id
    add_index :experiences, :skill_id
    add_index :experiences, :person_id
  end

  def self.down
    remove_index :experiences, :project_id
    remove_index :experiences, :skill_id
    remove_index :experiences, :person_id
    drop_table :experiences
  end
end

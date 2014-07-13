class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :project_id
      t.integer :person_id
      t.string :role
      t.string :description
      t.date :since
      t.date :till

      t.timestamps
    end
    add_index :assignments, :project_id
    add_index :assignments, :person_id
  end

  def self.down
    drop_table :assignments
  end
end

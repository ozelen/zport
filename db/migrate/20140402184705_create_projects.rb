class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :customer_id
      t.integer :provider_id
      t.string :team

      t.timestamps
    end
    add_index :projects, :customer_id
    add_index :projects, :provider_id
  end

  def self.down
    drop_table :projects
  end
end

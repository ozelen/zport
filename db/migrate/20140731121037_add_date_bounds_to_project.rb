class AddDateBoundsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :started, :date
    add_index :projects, :started
    add_column :projects, :finished, :date
    add_index :projects, :finished
  end
end

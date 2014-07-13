class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.date :since
      t.date :till
      t.belongs_to :company, index: true
      t.belongs_to :person, index: true

      t.timestamps
    end
  end
end

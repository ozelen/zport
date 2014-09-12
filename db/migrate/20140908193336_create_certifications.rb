class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :name
      t.text :description
      t.date :day_passed
      t.string :link
      t.float :value
      t.float :max_value

      t.timestamps
    end
  end
end

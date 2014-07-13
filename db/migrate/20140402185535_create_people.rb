class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :nickname
      t.string :slug
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :region
      t.string :address
      t.integer :zip
      t.string :phone
      t.string :website
      t.string :email
      t.references :addressable, polymorphic: true

      t.timestamps
    end
    add_index :addresses, :zip
  end
end

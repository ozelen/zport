class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :title
      t.string :description
      t.references :imageable, polymorphic: true

      t.timestamps
    end

    add_attachment :images, :picture
  end

  def self.down
    remove_attachment :images, :picture
  end
end

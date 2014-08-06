class CreateSkillCategories < ActiveRecord::Migration
  def change
    create_table :skill_categories do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end

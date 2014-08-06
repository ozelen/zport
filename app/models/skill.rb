class Skill < ActiveRecord::Base
  belongs_to :skill_category
  has_many :experiences
  has_many :projects, through: :experiences
  has_many :persons, through: :experiences
end

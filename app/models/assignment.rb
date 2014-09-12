class Assignment < ActiveRecord::Base
  belongs_to :project
  belongs_to :person
  has_many :experiences, dependent: :destroy
  has_many :skills, through: :experiences
  has_many :skill_categories, through: :skills

  #default_scope order('till desc')

end

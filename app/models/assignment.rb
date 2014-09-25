class Assignment < ActiveRecord::Base
  belongs_to :project
  belongs_to :person
  has_many :experiences, dependent: :destroy
  has_many :skills, through: :experiences
  has_many :skill_categories, through: :skills

  scope :latest, -> { order('till desc, since desc') }

end

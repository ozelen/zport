class Assignment < ActiveRecord::Base
  belongs_to :project
  belongs_to :person
  has_many :experiences, dependent: :destroy
  has_many :skills, through: :experiences
  has_many :skill_categories, through: :skills

  scope :latest, -> { order('till desc, since desc') }

  def skills_in_text(cat=nil)
    arr = skills.map { |s| s if !cat || s.skill_category == cat }.reject!(&:blank?)
    arr.join(', ') if arr
  end
end

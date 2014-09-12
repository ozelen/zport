class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :address, as: :addressable
  has_many :assignments, dependent: :destroy
  has_many :projects, through: :assignments
  has_many :experiences, through: :assignments
  has_many :skills, through: :experiences
  has_many :jobs, dependent: :destroy

  accepts_nested_attributes_for :address

  def to_s
    name = "#{first_name} #{last_name}"
    name.strip.present? ? name : email
  end

  def self.me
    first # TODO: connect with authentification
  end

  def employers
    jobs.by_type('employer')
  end

  def schools
    jobs.by_type('school')
  end

  def skill_sum
    skills.
        joins(:skill_category).
        select('skills.slug as skill_slug').
        select('skills.name as skill_name').
        select('SUM(days) as sum_days').
        select('MAX(experiences.rate) as max_rate').
        select('skill_categories.name as category_name').
        select('CASE WHEN (COUNT(*) <> COUNT(assignments.till)) THEN current_date ELSE MAX(assignments.till) END AS latest_experience').
      group('skills.name, skills.id, skill_categories.name, skill_category_id, skill_slug').
      order('max_rate desc, sum_days desc, sum_days, latest_experience desc').to_a
  end

  def languages
    skill_sum.map {|s| s.category_name if s.category_name == 'Languages' }.uniq
  end

  def skill_cats
    skill_sum.map {|s| s.category_name unless s.category_name == 'Languages' }.uniq
  end

  def admin?
    # TODO: apply cancan or another authorization
    id == 3
  end

end

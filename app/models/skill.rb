class Skill < ActiveRecord::Base
  belongs_to :skill_category
  has_many :experiences
  has_many :assignments, through: :experiences
  has_many :projects, through: :assignments
  has_many :people, through: :experiences

  LANG_LEVELS = ['Nicht verstehen!', 'Beginner', 'Elementary', 'Pre-Intermediate', 'Intermediate', 'Upper intermediate', 'Advanced', 'Native']

  def to_s
    name
  end

  # used within user's scope
  def last_time_faced
    Date::today - latest_experience
  end

  def lang_level(num)
    LANG_LEVELS[num]
  end

  def lang_summary
    max_rate ? LANG_LEVELS[max_rate] : nil
  end

  def relative_rate
    max_rate ? max_rate * 100 / Experience.maximum(:rate) : nil
  end

end

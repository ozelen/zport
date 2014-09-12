class SkillCategory < ActiveRecord::Base
  has_many :skills

  def to_s; name; end

end

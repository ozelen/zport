module SkillsHelper
  def skill_level(val)
    case val
      when 0..10    then 'noob'
      when 11..30   then 'beginner'
      when 31..60   then 'average'
      when 61..90   then 'strong'
      when 91..100  then 'expert'
    end
  end
end

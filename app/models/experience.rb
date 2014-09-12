class Experience < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :skill
  belongs_to :person

  def name; skill.name; end

  def to_s; name; end

end

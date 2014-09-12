class Certification < ActiveRecord::Base
  def year
    day_passed.year
  end
end

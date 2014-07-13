class Person < ActiveRecord::Base
  def to_s
    first_name + ' ' + last_name
  end

  def self.me
    first # TODO: connect with authentification
  end
end

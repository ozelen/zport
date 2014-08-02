class Person < ActiveRecord::Base
  has_one :address, as: :addressable

  accepts_nested_attributes_for :address

  def to_s
    first_name + ' ' + last_name
  end

  def self.me
    first # TODO: connect with authentification
  end
end

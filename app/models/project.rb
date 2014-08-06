class Project < ActiveRecord::Base
  belongs_to :provider, class_name: 'Company'
  belongs_to :customer, class_name: 'Company'
  has_many :images, as: :imageable
  has_many :experiences
  has_many :skills, through: :experiences
  has_many :persons, through: :experiences

  accepts_nested_attributes_for :images

  def to_s; name; end

end

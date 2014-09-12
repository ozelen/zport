class Project < ActiveRecord::Base
  belongs_to :provider, class_name: 'Company'
  belongs_to :customer, class_name: 'Company'
  has_many :images, as: :imageable
  has_many :experiences
  has_many :assignments, dependent: :destroy
  has_many :people, through: :assignments

  accepts_nested_attributes_for :images

  def to_s; name; end

end

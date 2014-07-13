class Project < ActiveRecord::Base
  belongs_to :provider, class_name: 'Company'
  belongs_to :customer, class_name: 'Company'
  has_many :images, as: :imageable
end

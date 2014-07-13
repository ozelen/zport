class Company < ActiveRecord::Base
  has_many :projects, foreign_key: :provider_id, dependent: :destroy
  has_many :orders, class_name: 'Project', foreign_key: :customer_id, dependent: :destroy

  def to_s; name; end

end

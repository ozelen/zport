class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  def self.attr_permitted
    [:country, :city, :region, :address, :zip, :phone, :website, :email]
  end
end

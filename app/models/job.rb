class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :person

  TYPES = %w(job education client)

  scope :by_type, -> (type_name) { where(type_id: TYPES.index(type_name)) }

  def type
    TYPES[type_id] if type_id
  end

  def self.types
    TYPES
  end

  def self.types_hash
    TYPES.map.with_index {|job, i| [job, i] }
  end

end

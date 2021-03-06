class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :person

  TYPES = %w(employer school client)

  scope :by_type, -> (type_name) { where(type_id: TYPES.index(type_name)) }
  scope :latest, -> { order('till desc') }
  default_scope { order('till desc, since desc')}

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

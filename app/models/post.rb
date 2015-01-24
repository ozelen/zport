class Post < ActiveRecord::Base
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags

  default_scope { order 'created_at desc' }
end

module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def tag_links post
    post.tags.map { |tag| link_to tag.name, posts_by_tag_path(tag.name) }.join(', ').html_safe
  end
end

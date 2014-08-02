class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_attached_file :picture, :styles => { :medium => "580x1200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def to_jq_upload
    {
        "name" => read_attribute(:image_file_name),
        "size" => read_attribute(:image_file_size),
        "url" => upload.url(:original),
        "delete_url" => image_path(self),
        "delete_type" => "DELETE"
    }
  end
end

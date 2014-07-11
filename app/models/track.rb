class Track < ActiveRecord::Base
  belongs_to :artist

  has_attached_file :audio
  has_attached_file :avatar, 
                    :styles => { :medium => "300x300>", :thumb => "150x150>" }, 
                    :default_url => "https://s3-us-west-2.amazonaws.com/trackfilter/default/default_250.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



end

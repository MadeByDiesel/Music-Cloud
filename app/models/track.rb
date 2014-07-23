class Track < ActiveRecord::Base
  belongs_to :artist

  has_attached_file :audio
  validates_attachment_presence :audio
  validates_attachment_size :audio,
                        :less_than => 150.megabytes,
                        :message => 'filesize must be less than 150 MegaBytes'
  validates_attachment_content_type :audio,
                        :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ],
                        :message => 'file must be of filetype .mp3'
  has_attached_file :avatar, 
                    :styles => { :medium => "200x200#", :thumb => "120x120#" }, 
                    :default_url => "/default/default_:style.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

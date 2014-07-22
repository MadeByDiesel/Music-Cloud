class Track < ActiveRecord::Base
  belongs_to :artist

  has_attached_file :audio
  has_attached_file :avatar, 
                    :styles => { :medium => "200x200#", :thumb => "120x120#" }, 
                    :default_url => "/default/default_:style.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



end

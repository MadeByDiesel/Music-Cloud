class Fan < ActiveRecord::Base
  has_one :user, as: :account, dependent: :destroy
  accepts_nested_attributes_for :user
  has_attached_file :avatar, 
                    :styles => { :medium => "200x200>", :thumb => "120x120>" }, 
                    :default_url => "https://s3-us-west-2.amazonaws.com/trackfilter/default/default_250.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

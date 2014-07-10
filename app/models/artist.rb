class Artist < ActiveRecord::Base
  has_one :user, as: :account, dependent: :destroy
  has_many :tracks, dependent: :destroy
  accepts_nested_attributes_for :user
  validates_uniqueness_of :artist_name 
  has_attached_file :avatar, 
                    :styles => { :medium => "300x300>", :thumb => "150x150>" }, 
                    :default_url => "https://s3-us-west-2.amazonaws.com/trackfilter/default/default_250.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

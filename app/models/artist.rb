class Artist < ActiveRecord::Base
  has_one :user, as: :account, dependent: :destroy
  has_many :tracks, dependent: :destroy
  accepts_nested_attributes_for :user
  #validates_uniqueness_of :artist_name 
  has_attached_file :avatar, 
                    :styles => { :medium => "200x200#", :thumb => "120x120#" }, 
                    :default_url => "/default/default_:style.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_attached_file :cover, 
                    :styles => { :large => "1140x350>", :thumb => "400x120>" }
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

end

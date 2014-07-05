class Artist < ActiveRecord::Base
  has_one :user, as: :account, dependent: :destroy
  accepts_nested_attributes_for :user
  validates_uniqueness_of :artistname 

end

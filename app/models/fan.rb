class Fan < ActiveRecord::Base
  has_one :user, as: :account, dependent: :destroy
  accepts_nested_attributes_for :user
end

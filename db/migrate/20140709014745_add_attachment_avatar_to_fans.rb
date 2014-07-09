class AddAttachmentAvatarToFans < ActiveRecord::Migration
  def self.up
    change_table :fans do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :fans, :avatar
  end
end

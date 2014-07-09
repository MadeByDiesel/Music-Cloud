class AddAttachmentAvatarToLabels < ActiveRecord::Migration
  def self.up
    change_table :labels do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :labels, :avatar
  end
end

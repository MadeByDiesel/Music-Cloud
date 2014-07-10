class AddAttachmentAvatarToTracks < ActiveRecord::Migration
  def self.up
    change_table :tracks do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :tracks, :avatar
  end
end

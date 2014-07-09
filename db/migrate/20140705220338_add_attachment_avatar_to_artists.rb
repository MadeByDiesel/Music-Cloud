class AddAttachmentAvatarToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :artists, :avatar
  end
end

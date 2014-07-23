class AddAttachmentCoverToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.attachment :cover
    end
  end

  def self.down
    drop_attached_file :artists, :cover
  end
end

class AddArtistToTracks < ActiveRecord::Migration
  def change
    add_reference :tracks, :artist, index: true
  end
end

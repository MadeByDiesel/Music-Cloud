class AddPermalinkToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :permalink, :string
  end
end

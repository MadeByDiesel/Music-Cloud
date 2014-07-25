class AddCityToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :city, :string
  end
end

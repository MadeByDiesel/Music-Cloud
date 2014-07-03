class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :artistname
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :genre

      t.timestamps
    end
  end
end

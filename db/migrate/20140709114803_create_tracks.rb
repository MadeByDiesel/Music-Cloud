class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track_title
      t.string :description
      t.string :track_type

      t.timestamps
    end
  end
end

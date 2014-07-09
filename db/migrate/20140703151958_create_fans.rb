class CreateFans < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.string :first_name
      t.string :last_name
      t.string :fan_name
      t.string :city
      t.string :country
      t.string :bio

      t.timestamps
    end
  end
end

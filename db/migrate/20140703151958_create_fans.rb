class CreateFans < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end

class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :label_name
      t.string :city
      t.string :country
      t.string :contactname
      t.string :bio

      t.timestamps
    end
  end
end

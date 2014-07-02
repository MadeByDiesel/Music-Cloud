class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :labelname
      t.string :city
      t.string :country
      t.string :contactname

      t.timestamps
    end
  end
end

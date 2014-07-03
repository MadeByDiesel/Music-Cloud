class AddAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_id, :integer
    add_column :users, :account_type, :string

    add_index :users, [:account_id, :account_type]
  end
end

class AddTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :account_type, :string, default: "user"
  end
end

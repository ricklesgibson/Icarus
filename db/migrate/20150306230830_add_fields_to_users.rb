class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :integer
    add_column :users, :phone, :string
    add_column :users, :payment_id, :integer
  end
end

class AddFieldsToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :car_id, :integer
    add_column :owners, :street_address, :string
    add_column :owners, :city, :string
    add_column :owners, :state, :string
    add_column :owners, :zip, :integer
    add_column :owners, :phone, :string
    add_column :owners, :payment_id, :integer
  end
end

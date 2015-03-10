class AddEmailToPilot < ActiveRecord::Migration
  def change
    add_column :pilots, :email, :string
  end
end

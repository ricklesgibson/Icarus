class AddElementsToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :drivers_license, :string
  end
end

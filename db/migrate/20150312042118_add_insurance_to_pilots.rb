class AddInsuranceToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :insurance, :string
  end
end

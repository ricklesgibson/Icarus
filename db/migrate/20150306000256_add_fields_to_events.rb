class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :last_charge, :datetime
    add_column :events, :last_wash, :datetime
  end
end

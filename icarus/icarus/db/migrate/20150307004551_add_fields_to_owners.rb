class AddFieldsToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :avatar_file_name, :string
    add_column :owners, :avatar_content_type, :string
    add_column :owners, :avatar_file_size, :integer
    add_column :owners, :avatar_updated_at, :datetime
    add_column :owners, :account_type, :string
  end
end

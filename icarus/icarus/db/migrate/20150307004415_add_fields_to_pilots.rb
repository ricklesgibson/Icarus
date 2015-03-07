class AddFieldsToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :avatar_file_name, :string
    add_column :pilots, :avatar_content_type, :string
    add_column :pilots, :avatar_file_size, :integer
    add_column :pilots, :avatar_updated_at, :datetime
    add_column :pilots, :account_type, :string
  end
end

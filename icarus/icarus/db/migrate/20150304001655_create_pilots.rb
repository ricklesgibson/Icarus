class CreatePilots < ActiveRecord::Migration
  def change
    create_table :pilots do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest

      t.timestamps null: false
    end
  end
end

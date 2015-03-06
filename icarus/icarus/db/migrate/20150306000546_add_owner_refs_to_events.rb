class AddOwnerRefsToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :owner, index: true
    add_foreign_key :events, :owners
  end
end

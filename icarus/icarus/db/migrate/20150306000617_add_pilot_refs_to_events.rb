class AddPilotRefsToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :pilot, index: true
    add_foreign_key :events, :pilots
  end
end

class EventIdToString < ActiveRecord::Migration
  def change
    change_column :commits, :event_id, :string
  end
end

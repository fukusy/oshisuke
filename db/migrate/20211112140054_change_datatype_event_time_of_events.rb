class ChangeDatatypeEventTimeOfEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :event_time, :time
  end
end

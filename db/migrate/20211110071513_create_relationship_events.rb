class CreateRelationshipEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :relationship_events do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end

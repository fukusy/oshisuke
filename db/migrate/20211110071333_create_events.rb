class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :tag_id
      t.string :event_date
      t.string :event_time
      t.string :event_name
      t.text :event_content

      t.timestamps
    end
  end
end

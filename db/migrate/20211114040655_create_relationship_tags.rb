class CreateRelationshipTags < ActiveRecord::Migration[5.2]
  def change
    create_table :relationship_tags do |t|
      t.integer :tag_id
      t.integer :event_id
      

      t.timestamps
    end
  end
end

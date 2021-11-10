class CreateRelationshipUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :relationship_users do |t|
      t.integer :follower_id
      t.integer :followered_id

      t.timestamps
    end
  end
end

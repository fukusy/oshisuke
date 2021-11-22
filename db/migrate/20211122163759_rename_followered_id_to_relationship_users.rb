class RenameFolloweredIdToRelationshipUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :relationship_users, :followered_id, :followed_id
  end
end

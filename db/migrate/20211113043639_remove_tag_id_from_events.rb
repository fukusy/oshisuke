class RemoveTagIdFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :tag_id, :integer
  end
end

class AddRelatinshipTagIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :relationship_tag_id, :integer
  end
end

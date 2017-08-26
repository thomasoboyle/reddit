class AddColumnsToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :parent_id, :integer
    add_column :comments, :parent_type, :string
  end
end

class AddPolymorphicToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :commentable, polymorphic: true
    add_index :comments, [:commentable_id, :commentable_type]
  end
end

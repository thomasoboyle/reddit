class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
     t.integer :score
     t.references :parent, polymorphic: true
     t.references :user, foreign_key: true
    end
  end
end

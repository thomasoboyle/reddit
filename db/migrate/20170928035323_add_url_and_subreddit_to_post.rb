class AddUrlAndSubredditToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :url, :string
    add_column :posts, :subreddit, :string
  end
end

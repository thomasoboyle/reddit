# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  body        :text
#  parent_type :string
#  parent_id   :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  post_id     :integer
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :parent, polymorphic: true
  has_many :votes, as: :parent
  has_many :comments, as: :parent
  validates :user_id, presence: true
  validates :body, presence: true, length: { minimum: 1}

  def vote_total
    self.upvotes + self.downvotes
  end

  def score_total
    self.upvotes - self.downvotes
  end

  def upvotes
    self.votes.where(score: 1).size
  end

  def downvotes
    self.votes.where(score: -1).size
  end
end

# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  score       :integer
#  parent_type :string
#  parent_id   :integer
#  user_id     :integer
#

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :parent, polymorphic: true
  has_one :vote
  validates_uniqueness_of :user_id, scope: [:parent_type, :parent_id]
end

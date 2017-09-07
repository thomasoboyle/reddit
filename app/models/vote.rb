class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :parent, polymorphic: true
  has_one :vote
  validates_uniqueness_of :user_id, scope: [:parent_type, :parent_id]
end

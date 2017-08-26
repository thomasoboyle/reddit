class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :parent
	validates :title, presence: true,
										length: { minimum: 5 }
end

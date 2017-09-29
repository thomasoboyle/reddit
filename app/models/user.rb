class User < ApplicationRecord
  has_many :posts
  has_many :comments

  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def to_param
    username
  end

  def post_karma
    count = 0
    self.posts.each do |post|
      count += post.score_total
    end
    return count
  end

  def comment_karma
    count = 0
    self.comments.each do |comment|
      count += comment.score_total
    end
    return count
  end

  def content
    content = (Post.where(user:self) + Comment.where(user:self)).sort_by(&:created_at).reverse
  end
end

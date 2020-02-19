class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {maximum: Settings.post.content.maximum}
  default_scope -> { order created_at: :desc }
  scope :by_author, ->(user_id){where user_id: user_id}
end

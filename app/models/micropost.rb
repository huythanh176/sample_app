class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {maximum: Settings.post.content.maximum}
  default_scope -> { order created_at: :desc }
  scope :by_author, ->(user_id){where user_id: user_id}
  mount_uploader :picture, PictureUploader

  private
# Validates the size of an uploaded picture.
  def picture_size
    if picture.size > Settings.post.picture.size.megabytes
      errors.add :picture, I18n.t("users.micropost.picture_invalid",
                                  size: Settings.post.picture.size)
    end
  end
end

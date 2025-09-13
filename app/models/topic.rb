class Topic < ApplicationRecord
  belongs_to :discussion
  has_many :social_media_posts, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  scope :with_social_posts, -> { joins(:social_media_posts).distinct }
  scope :without_social_posts, -> { left_joins(:social_media_posts).where(social_media_posts: { id: nil }) }

  def posted_to_platforms
    social_media_posts.where(status: 'posted').pluck(:platform).uniq
  end

  def can_post_to?(platform)
    !social_media_posts.exists?(platform: platform, status: ['posted', 'pending'])
  end
end

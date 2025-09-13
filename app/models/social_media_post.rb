class SocialMediaPost < ApplicationRecord
  belongs_to :topic

  PLATFORMS = %w[twitter facebook linkedin instagram].freeze
  STATUSES = %w[draft pending posted failed].freeze

  validates :platform, presence: true, inclusion: { in: PLATFORMS }
  validates :content, presence: true, length: { maximum: 280 } # Twitter's limit
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :platform_post_id, uniqueness: { scope: :platform }, allow_blank: true

  scope :posted, -> { where(status: 'posted') }
  scope :pending, -> { where(status: 'pending') }
  scope :failed, -> { where(status: 'failed') }
  scope :for_platform, ->(platform) { where(platform: platform) }

  def posted?
    status == 'posted'
  end

  def pending?
    status == 'pending'
  end

  def failed?
    status == 'failed'
  end

  def platform_url
    return unless platform_post_id && posted?

    case platform
    when 'twitter'
      "https://twitter.com/user/status/#{platform_post_id}"
    when 'facebook'
      "https://facebook.com/posts/#{platform_post_id}"
    when 'linkedin'
      "https://linkedin.com/posts/#{platform_post_id}"
    when 'instagram'
      "https://instagram.com/p/#{platform_post_id}/"
    end
  end
end

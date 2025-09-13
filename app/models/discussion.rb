class Discussion < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :social_media_posts, through: :topics

  validates :title, presence: true, length: { maximum: 255 }
  validates :status, presence: true, inclusion: { in: %w[draft active archived] }

  scope :active, -> { where(status: 'active') }
  scope :draft, -> { where(status: 'draft') }
  scope :archived, -> { where(status: 'archived') }
end

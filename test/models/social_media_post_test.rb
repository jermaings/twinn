require "test_helper"

class SocialMediaPostTest < ActiveSupport::TestCase
  test "social media post should require platform, content, and status" do
    discussion = Discussion.create!(title: "Test Discussion", description: "Test description", status: "active")
    topic = discussion.topics.create!(title: "Test Topic", description: "Test topic description")
    
    post = topic.social_media_posts.new(
      platform: "twitter",
      content: "Test content",
      status: "draft"
    )
    
    assert post.valid?
  end

  test "social media post should validate platform" do
    discussion = Discussion.create!(title: "Test Discussion", description: "Test description", status: "active")
    topic = discussion.topics.create!(title: "Test Topic", description: "Test topic description")
    
    post = topic.social_media_posts.new(
      platform: "invalid_platform",
      content: "Test content",
      status: "draft"
    )
    
    assert_not post.valid?
  end

  test "social media post should generate platform URL when posted" do
    discussion = Discussion.create!(title: "Test Discussion", description: "Test description", status: "active")
    topic = discussion.topics.create!(title: "Test Topic", description: "Test topic description")
    
    post = topic.social_media_posts.create!(
      platform: "twitter",
      content: "Test content",
      status: "posted",
      platform_post_id: "12345"
    )
    
    assert_equal "https://twitter.com/user/status/12345", post.platform_url
  end
end

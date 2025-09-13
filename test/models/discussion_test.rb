require "test_helper"

class DiscussionTest < ActiveSupport::TestCase
  test "discussion should have title and status" do
    discussion = Discussion.new(title: "Test Discussion", description: "Test description", status: "active")
    assert discussion.valid?
  end

  test "discussion should require title" do
    discussion = Discussion.new(description: "Test description", status: "active")
    assert_not discussion.valid?
  end

  test "discussion should require valid status" do
    discussion = Discussion.new(title: "Test Discussion", description: "Test description", status: "invalid")
    assert_not discussion.valid?
  end

  test "discussion can have topics" do
    discussion = Discussion.create!(title: "Test Discussion", description: "Test description", status: "active")
    topic = discussion.topics.create!(title: "Test Topic", description: "Test topic description")
    
    assert_equal 1, discussion.topics.count
    assert_equal discussion, topic.discussion
  end
end

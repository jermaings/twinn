require "test_helper"

class SocialMediaPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get social_media_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get social_media_posts_create_url
    assert_response :success
  end

  test "should get show" do
    get social_media_posts_show_url
    assert_response :success
  end

  test "should get update" do
    get social_media_posts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get social_media_posts_destroy_url
    assert_response :success
  end
end

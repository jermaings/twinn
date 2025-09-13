class SocialMediaPostsController < ApplicationController
  before_action :set_discussion_and_topic
  before_action :set_social_media_post, only: [:show, :update, :destroy]

  def new
    @social_media_post = @topic.social_media_posts.build
  end

  def create
    @social_media_post = @topic.social_media_posts.build(social_media_post_params)
    @social_media_post.status ||= 'draft'

    if @social_media_post.save
      redirect_to [@discussion, @topic, @social_media_post], notice: 'Social media post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @social_media_post.update(social_media_post_params)
      redirect_to [@discussion, @topic, @social_media_post], notice: 'Social media post was successfully updated.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @social_media_post.destroy
    redirect_to [@discussion, @topic], notice: 'Social media post was successfully deleted.'
  end

  private

  def set_discussion_and_topic
    @discussion = Discussion.find(params[:discussion_id])
    @topic = @discussion.topics.find(params[:topic_id])
  end

  def set_social_media_post
    @social_media_post = @topic.social_media_posts.find(params[:id])
  end

  def social_media_post_params
    params.require(:social_media_post).permit(:platform, :content, :status)
  end
end

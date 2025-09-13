class TopicsController < ApplicationController
  before_action :set_discussion
  before_action :set_topic, only: [:show, :edit, :update, :destroy, :post_to_social_media]

  def show
    @social_media_posts = @topic.social_media_posts.order(created_at: :desc)
    @available_platforms = SocialMediaPost::PLATFORMS - @topic.posted_to_platforms
  end

  def new
    @topic = @discussion.topics.build
  end

  def create
    @topic = @discussion.topics.build(topic_params)

    if @topic.save
      redirect_to [@discussion, @topic], notice: 'Topic was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to [@discussion, @topic], notice: 'Topic was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy
    redirect_to @discussion, notice: 'Topic was successfully deleted.'
  end

  def post_to_social_media
    platform = params[:platform]
    
    if SocialMediaPost::PLATFORMS.include?(platform) && @topic.can_post_to?(platform)
      content = generate_social_content(@topic)
      
      @social_media_post = @topic.social_media_posts.build(
        platform: platform,
        content: content,
        status: 'pending'
      )
      
      if @social_media_post.save
        # In a real application, you would integrate with actual social media APIs here
        # For now, we'll simulate a successful post
        simulate_social_post(@social_media_post)
        
        redirect_to [@discussion, @topic], notice: "Topic posted to #{platform.titleize} successfully!"
      else
        redirect_to [@discussion, @topic], alert: 'Failed to create social media post.'
      end
    else
      redirect_to [@discussion, @topic], alert: 'Invalid platform or already posted to this platform.'
    end
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  def set_topic
    @topic = @discussion.topics.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description)
  end

  def generate_social_content(topic)
    content = "#{topic.title}\n\n#{topic.description}"
    
    # Truncate to platform limits
    if content.length > 280
      content = content[0..276] + "..."
    end
    
    content
  end

  def simulate_social_post(social_media_post)
    # Simulate successful posting to social media
    # In a real app, this would make API calls to the respective platforms
    social_media_post.update!(
      status: 'posted',
      platform_post_id: "fake_#{social_media_post.platform}_#{SecureRandom.hex(8)}",
      posted_at: Time.current
    )
  end
end

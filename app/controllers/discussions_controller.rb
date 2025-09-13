class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  def index
    @discussions = Discussion.all.order(created_at: :desc)
  end

  def show
    @topics = @discussion.topics.order(created_at: :desc)
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.status ||= 'draft'

    if @discussion.save
      redirect_to @discussion, notice: 'Discussion was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @discussion.update(discussion_params)
      redirect_to @discussion, notice: 'Discussion was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @discussion.destroy
    redirect_to discussions_url, notice: 'Discussion was successfully deleted.'
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def discussion_params
    params.require(:discussion).permit(:title, :description, :status)
  end
end

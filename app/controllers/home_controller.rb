class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @title = 'Twinn Kiss in Clayton, NJ'
  end
end

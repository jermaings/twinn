class FaqsController < ApplicationController
  def index
    @query = params[:q]
    @copy_image = '<img src="COPIED_URL/preview" width="1OO" height="100">'
    @copy_video = '<video width="1OO" height="100" controls> <source src="FILE_URL/preview"> </video>'
    # In a real application, you would perform a search operation here,
    # for example, filtering a collection of records based on @query.
    # For a simple search within a single HTML.erb, you might not need complex logic here.
  end
end

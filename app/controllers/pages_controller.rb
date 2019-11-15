class PagesController < ApplicationController
  def index
    render json: { hello: message }
  end

  private

  def message
    'Learn more by going to '\
    'https://github.com/perezperret/postsec_api_rails#postsecapi'
  end
end

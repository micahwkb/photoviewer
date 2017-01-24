class HomeController < ApplicationController
  include PhotoFetcher
  # include GetAccessToken

  def index
    # if session[:user_id]
    #   @token = generate_access_token
    # end
    @photos = photo_fetcher(session[:user_credentials])
  end
end

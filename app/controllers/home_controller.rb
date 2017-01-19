class HomeController < ApplicationController
  include PhotoFetcher

  def index
    @photos = photo_fetcher(session[:user_key], session[:user_secret])
  end
end

class HomeController < ApplicationController
  include PhotoFetcher

  def index
    @photos = photo_fetcher
  end
end

class HomeController < ApplicationController
  include PhotoFetcher

  def index
    byebug
    go
  end
end

module PhotoFetcher
  extend ActiveSupport::Concern

  BASE_URI = 'https://api.500px.com/v1/photos'
  CONSUMER_KEY = ENV['500PX_CONSUMER_KEY']

  def go
    puts "go"
  end
end
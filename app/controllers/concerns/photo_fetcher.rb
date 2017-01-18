module PhotoFetcher
  extend ActiveSupport::Concern

  BASE_URI = 'https://api.500px.com/v1/photos'
  CONSUMER_KEY = ENV['500PX_CONSUMER_KEY']


  def photo_fetcher
    uri = URI(BASE_URI)
    params = {
      consumer_key:   CONSUMER_KEY,
      sort:           'rating',
      feature:        'popular',
      image_size:     '4',
      include_store:  'store_download',
      rpp:             '100',
      include_states: 'favorited'
    }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    photos = JSON.parse res.body

    return photos['photos']
  end
end
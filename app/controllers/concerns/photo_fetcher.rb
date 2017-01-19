module PhotoFetcher
  extend ActiveSupport::Concern

  BASE_URI = 'https://api.500px.com/v1/photos'
  CONSUMER_KEY = ENV['500PX_CONSUMER_KEY']


  def photo_fetcher(user_key, user_secret)
    consumer_key    = user_key ? user_key : CONSUMER_KEY
    consumer_secret = user_secret ? user_secret : nil
    uri             = URI(BASE_URI)

    params = {
      consumer_key:    consumer_key,
      consumer_secret: consumer_secret,
      sort:            'rating',
      feature:         'popular',
      image_size:      '4',
      include_store:   'store_download',
      rpp:             '100',
      include_states:  'favorited'
    }

    uri.query = URI.encode_www_form(params)
    res       = Net::HTTP.get_response(uri)
    photos    = JSON.parse res.body
  byebug
    return photos['photos']
  end

  def get_token
    if !current_user
      return ENV['500PX_CONSUMER_KEY']
    else
      byebug
      return session[:user_token]
    end
  end
end
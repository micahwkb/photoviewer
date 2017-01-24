module PhotoFetcher
  extend ActiveSupport::Concern

  BASE_URL = 'https://api.500px.com/v1/photos'
  CONSUMER_KEY = ENV['500PX_CONSUMER_KEY']

  PARAMS = {
    feature:        'popular',
    sort:           'rating',
    image_size:     '4',
    include_store:  'store_download',
    rpp:            '1',
    include_states: 'voted',
    exclude:        'nsfw'
  }

  def photo_fetcher(user_credentials)
    if user_credentials
      authenticated_fetch(user_credentials)
    else
      public_fetch
    end
  end

  def public_fetch
    req = URI(BASE_URL)

    PARAMS[:consumer_key] = CONSUMER_KEY
    req.query = URI.encode_www_form(PARAMS)
    res       = Net::HTTP.get_response(req)

    photos    = JSON.parse res.body
    photos['photos']
  end

  def authenticated_fetch
    access_token = get_access_token
    byebug
  end

  def get_access_token(user_credentials)
    # consumer_key, consumer_secret, token, token_secret
    p "get_access_token: Initializing Consumer"
    consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {
      site:               BASE_URL,
      request_token_path: "/v1/oauth/request_token",
      access_token_path:  "/v1/oauth/access_token",
      authorize_path:     "/v1/oauth/authorize"})

    request_token = consumer.get_request_token()
    p "Request URL: #{request_token.authorize_url}"
    request_token
  end
end
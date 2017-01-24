module PhotoFetcher
  extend ActiveSupport::Concern

  BASE_URL = 'https://api.500px.com/'
  CONSUMER_KEY = ENV['500PX_CONSUMER_KEY']
  PHOTO_URL = "#{BASE_URL}v1/photos"
  PARAMS = {
    feature:        'popular',
    sort:           'rating',
    image_size:     '4',
    include_store:  'store_download',
    rpp:            '1',
    include_states: 'voted',
    exclude:        'nsfw'
  }

  def photo_fetcher(credentials)
    if credentials
      authenticated_fetch(credentials)
    else
      public_fetch
    end
  end

  def public_fetch
    req = URI(PHOTO_URL)

    PARAMS[:consumer_key] = CONSUMER_KEY

    req.query = build_query
    res       = Net::HTTP.get_response(req)
    photos    = JSON.parse res.body

    photos['photos']
  end

  def authenticated_fetch(credentials)
    access_token = get_access_token(credentials)

    path   = "#{PHOTO_URL}?#{build_query}"
    photos = JSON.parse access_token.get(path).body

    photos['photos']
  end

  def get_access_token(credentials)
    p "get_access_token: Initializing Consumer"
    consumer = OAuth::Consumer.new(
      credentials['consumer_key'], credentials['consumer_secret'], {
      site:               BASE_URL,
      request_token_path: "/v1/oauth/request_token",
      access_token_path:  "/v1/oauth/access_token",
      authorize_path:     "/v1/oauth/authorize"})

    access_token = OAuth::AccessToken.new(consumer, credentials[:token], credentials[:secret])
    access_token

    # request_token = consumer.get_request_token()
    # p "Request URL: #{request_token.authorize_url}"
    # request_token
  end

  def build_query
    URI.encode_www_form(PARAMS)
  end
end
Koala.configure do |config|
  #config.access_token = MY_TOKEN
  #config.app_access_token = MY_APP_ACCESS_TOKEN
  config.app_id = ENV["fb_app_id"]
  config.app_secret = ENV["fb_app_secret"]
  # See Koala::Configuration for more options, including details on how to send requests through
  # your own proxy servers.
end
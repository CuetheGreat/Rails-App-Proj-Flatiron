Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['G_CLIENT'], ENV['G_SECRET']
  # additional code for Identity and other strategies can go here
end

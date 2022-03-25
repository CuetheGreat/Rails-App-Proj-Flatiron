Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://127.0.0.1:3000', 'localhost:3000'
    resource '*', headers: :any, methods: %i[get post patch put]
  end
end

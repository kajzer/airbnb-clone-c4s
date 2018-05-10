Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  
  
  config.action_cable.url = "ws://airbnb-code4startup-kajzer.c9users.io/cable"
  
  
  config.action_mailer.default_url_options = { host: 'https://airbnb-code4startup-kajzer.c9users.io' }
  
  config.action_mailer.delivery_method = :smtp
  
  # Mailgun settings
  config.action_mailer.smtp_settings = {
    address: 'smtp.mailgun.org',
    port: 2525,
    domain: 'sandbox51f35e0f38024af2b15b584674aaff0c.mailgun.org',
    authentication: 'plain',
    user_name: ENV['mailgun_username'],
    password: ENV['mailgun_password']
  }
  
  # Config for gmail
  # config.action_mailer.smtp_settings = {
  #   address: 'smtp.gmail.com',
  #   port: 587,
  #   enable_starttls_auto: true,
  #   authentication: 'plain',
  #   user_name: ENV['guser_name'],
  #   password: ENV['gpassword']
  # }
  
  # Old config for aws sdk 2.8
  config.paperclip_defaults = {
    storage: :s3,
    path: ':class/:attachment/:id/:style/:filename',
    s3_host_name: 's3-eu-west-1.amazonaws.com',
    s3_credentials: {
      bucket: 'airpikachucode4startup',
      access_key_id: ENV['aws-id'],
      secret_access_key: ENV['aws-secret'],
      s3_region: 'eu-west-1'
    }
  }
end

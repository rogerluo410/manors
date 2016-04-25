Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Config  Redis access
  config.redis_server_host = "127.0.0.1"
  config.redis_server_port = 6379

  config.action_mailer.delivery_method = :smtp
  # Defaults to:
  # config.action_mailer.sendmail_settings = {
  #   :location => '/usr/sbin/sendmail',
  #   :arguments => '-i -t'
  # }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true

    Rails.application.config.middleware.use ExceptionNotification::Rack,
  :email => {
    :email_prefix => "[Exception] ",
    :sender_address => %{"Exception Notifier" <wh.yunlu.log@gmail.com>},
    :exception_recipients => %w{rogerluo410@gmail.com},
    :delivery_method => :smtp,
    :smtp_settings => {
      :address => "smtp.gmail.com",
      :port => 587,
      :user_name => "wh.yunlu.log",
      :password => "c@shcows",
      :domain => "gmail.com",
      :authentication => "plain", 
      :enable_starttls_auto => true
    }
  }

end

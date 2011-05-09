Conf::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # The production environment is meant for finished, "live" apps.
  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Specifies the header that your server uses for sending files
  config.action_dispatch.x_sendfile_header = "X-Sendfile"

  # For nginx:
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

  # If you have no front-end server that supports something like X-Sendfile,
  # just comment this out and Rails will serve the files

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  config.cache_store = :memory_store

  # Disable Rails's static asset server (Rails default)
  # In production, Apache or nginx will already do this
  # Warning: Refinery CMS has enabled this setting.
  # Disabling this will means files in your public directly
  # won't override core assets that are served from the plugin public directories.
  config.serve_static_assets = true

  # Enable serving of images, stylesheets, and javascripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
end

ActionMailer::Base. smtp_settings = {
  :domain => 'thestrangeloop.com'
}


# When true will use Amazon's Simple Storage Service on your production machine
# instead of the default file system for resources and images
# Make sure to your bucket info is correct in amazon_s3.yml
Refinery.s3_backend = !(ENV['S3_KEY'].nil? || ENV['S3_SECRET'].nil?)
Refinery.rescue_not_found = true

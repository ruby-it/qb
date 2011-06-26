# Be sure to restart your webserver when you modify this file.

# Uncomment below to force Rails into production mode
# (Use only when you can't set environment variables through your web/app server)
#ENV['RAILS_ENV'] = 'production'
RAILS_CONNECTION_ADAPTERS = %w(mysql)
SITE_NAME='Ruby Italia'
LIST_URL="http://lists.ruby-it.org/mailman/listinfo/ml"

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Skip frameworks you're not going to use
  config.frameworks -= [ :action_web_service, :action_mailer ]

  # Add additional load paths for your own custom dirs
  config.load_paths += %W( #{RAILS_ROOT}/app/cachers )

  # Force all environments to use the same logger level 
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Only include the connection adapters you're actually going to use
  # config.connection_adapters = %w( mysql postgresql sqlite sqlserver db2 oci )

  # Use the database for sessions instead of the file system
  # (create the session table with 'rake create_sessions_table')
  # config.action_controller.session_store = :active_record_store

  # Enable page/fragment caching by setting a file-based store
  # (remember to create the caching directory and make it readable to the application)
  # config.action_controller.fragment_cache_store = :file_store, "#{RAILS_ROOT}/cache"
  #FIXME: this should be reactivated
  #config.active_record.observers = :page_title_cache

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc

  # See Rails::Configuration for more options
end

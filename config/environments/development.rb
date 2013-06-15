Musicmindbeta::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  # config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.eager_load = false 

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  config.after_initialize do

  ActiveMerchant::Billing::Base.mode = :test
  ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
    :login => "joshua.chestang_api1.gmail.com",
    :password => "2BZS23Q36PG6AZZP",
    :signature => "A5tRViS56TbtX3Mc8LK7btxNOU73A9qcAYOqCT.vVj3EhqB1Ea919glt"
  )
  end
  

  ENV["TWITTER_CONSUMER_KEY"] = "ay4l7Qb57OGbS5yv0GDzMw"
ENV["TWITTER_CONSUMER_SECRET"] = "8hmp0E9BsTIK9qCkbQqsqr9XxUXDe1nkMutiv7HebI"

ENV["FACEBOOK_APP_ID"] = "309085772520317"
ENV["FACEBOOK_APP_SECRET"] = "b85ee884f017194f293a7be1c7e439be"

ENV["IMAGE_MAGICK_PATH"] = "/opt/local/bin" 
end

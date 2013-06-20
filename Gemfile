source 'http://rubygems.org'

ruby '2.0.0'
gem 'rails', '3.2.13'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'less-rails'
  gem 'therubyracer'
  gem 'compass'
  gem "zurb-foundation", "~> 4.2.2"
end

group :production do
  gem 'pg'
  gem 'thin'
end

# group :development, :test do
#   gem 'pg'
# end

#gem "mysql2"

gem 'pg'
gem 'sqlite3'





#gem 'vulcan'

gem "rmagick"

gem "passenger"

gem "capistrano", "~> 2.13.5"

gem "taglib-ruby", :git => "https://github.com/robinst/taglib-ruby.git"


gem "thor", "~> 0.14.6"

gem 'delayed_job_active_record'


gem "twitter-bootstrap-rails" #, "~> 2.1.1"

gem 'json', '~> 1.6.5'

gem "multi_json", "~> 1.3.6"

#attachment management
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"

#ativity feed
gem 'public_activity', '~> 0.3.4'

gem 'jquery-rails'

#nested-album-form
gem 'nested_form', :git => 'https://github.com/ryanb/nested_form.git'

#creates pattern for widget to send form data in json back to server
gem "js_message"

gem 'kaminari'

#gem 'will_paginate'


#user authentication
gem 'devise'

#notification - basic
gem 'unread', '~> 0.1.1'

#id3 tag reader for songs
gem "id3", "~> 1.0.0.pre6"

#disqus commenting
gem "disqus", "~> 1.0.4"


#gravatar images for users with no profile picture
gem 'gravatar_image_tag'

#amazon s3 for song storage
gem 'aws-sdk'

#authentication for twitter
gem 'omniauth-twitter'

#pretty urls
gem 'friendly_id'

gem 'tire'

group :development do
  gem 'rspec-rails'
  gem 'nifty-generators'
  gem 'annotate'
  gem 'faker'
end

group :test do
  gem 'rspec-rails'
  gem 'webrat'
  gem 'spork', '~> 0.9.0.rc'
  gem 'factory_girl_rails'
  gem 'watchr'
end

#?
gem 'progress_bar'

#web intents - twitter
gem 'tweet-button'



#like buttons
gem 'facebook_share'

#rails paypal interfacing
gem 'activemerchant', :require => 'active_merchant'

#gem 'bootstrap-will_paginate'

gem 'bootstrap-kaminari-views'

gem 'omniauth-facebook'

gem 'simple_form'

gem 'country_select'

# gem 'tiny_tds'
# gem 'activerecord-sqlserver-adapter'
# gem 'ruby-odbc'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
#gem 'capistrano'

# To use debugger
gem 'debugger'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'minitest'
end
gem "mocha", :group => :test


gem 'activerecord-deprecated_finders'

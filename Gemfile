source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Database Gems
gem 'pg'

# User control gems
gem 'devise', github: 'plataformatec/devise'
gem 'cancancan'

# Using tags
gem 'acts-as-taggable-on'

# Using Paperclip for attachments
gem 'paperclip'

# FrontEnd Gems
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'html5_validators'
gem 'jquery-datatables-rails', git: 'git://github.com/rweng/jquery-datatables-rails.git'
gem 'sass-rails', '~> 4.0.0'
gem 'will_paginate'
gem 'chosen-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

group :development, :test do
  # optimization gems
  gem 'bullet'

  # TTD gems
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'

  gem 'faker'

  # debug gems
  gem 'coffee-rails-source-maps'
  gem 'jazz_hands'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

group :production do
  gem 'faker' #this is used for demoing the site
  gem 'rails_12factor'
end


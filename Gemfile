source 'http://ruby.taobao.org'

gem 'rails', '3.2.15'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'slim-rails'
gem 'bootstrap-sass', '~> 3.1.0'

gem 'simple_form'
gem 'will_paginate'

gem 'bootstrap-will_paginate'
gem 'inherited_resources'

gem 'devise'
gem 'cancan'

gem 'state_machine'
gem 'draper', '~> 1.3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
group :development do
  gem 'thin'
  gem 'rack-livereload'
  gem 'guard'
  gem 'guard-livereload', require: false
  gem 'letter_opener'
  gem 'better_errors'
  gem 'awesome_print'
end

group :test do
  gem 'rspec-rails'
end

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.0'
end
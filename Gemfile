source 'https://rubygems.org'

gem 'rails',     :git => 'git://github.com/rails/rails.git', :branch => '3-2-stable'
gem 'journey',   :git => 'git://github.com/rails/journey.git', :branch => '1-0-stable'
gem 'arel',      :git => 'git://github.com/rails/arel.git', :branch => '3-0-stable'

gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   :git => 'git://github.com/rails/sass-rails.git', :branch => '3-2-stable'
  gem 'coffee-rails', :git => 'git://github.com/rails/coffee-rails.git', :branch => '3-2-stable'
  gem "therubyracer"
  gem "less-rails"
  gem "twitter-bootstrap-rails"
  gem "angular-rails"


  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do 
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'ZenTest', "~> 4.8.3"
  gem 'autotest-rails'
  gem "rspec-rails", "~> 2.0"
  gem 'mocha', require: false
end

group :production do
  gem 'thin'
end

gem 'jquery-rails'

gem "paperclip", "~> 3.0"

gem 'rabl'
gem 'oj'


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

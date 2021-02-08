source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.0.7", ">= 5.0.7.2"
gem "bcrypt", "~> 3.1.7"
gem "faker", "1.7.3"
gem "will_paginate", "3.1.5"
gem "i18n-js"
gem "bootstrap-will_paginate", "1.0.0"
gem "config"
gem "carrierwave", "1.3.2"
gem "mini_magick", "4.7.0"
gem "fog", "1.40.0"
# Use Puma as the app server
gem "puma", "~> 3.0"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
gem "bootstrap-sass", "3.4.1"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails", "4.3.1"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "byebug", platform: :mri
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
  gem "sqlite3", git: "https://github.com/larskanis/sqlite3-ruby",
  branch: "add-gemspec"
end

group :development do
  gem "listen", "3.1.5"
  gem "spring", "2.0.2"
  gem "spring-watcher-listen", "2.0.1"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "guard", "2.13.0"
  gem "guard-minitest", "2.4.4"
  gem "minitest", "5.10.3"
  gem "minitest-reporters", "1.1.14"
  gem "rails-controller-testing", "1.0.2"
end

group :production do
  gem "pg", "1.2.1"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

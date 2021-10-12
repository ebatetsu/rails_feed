source 'https://rubygems.org'

ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.6'
gem 'feedjira'
gem 'metainspector'
gem 'twitter-bootstrap-rails'
gem 'bootstrap-sass'
gem 'bcrypt'
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
gem 'faker'
gem 'puma', '~> 5.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'will_paginate',           '3.1.6'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'carrierwave'
gem 'mini_magick'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'devise'
gem 'slim-rails'
gem 'carrierwave'
gem 'rmagick'
gem 'ransack'


group :development, :test do

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do

  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'meta_request'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.14.1'
  gem 'guard-minitest',           '2.4.6'
end

group :production do
  gem 'fog',  '1.42'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://ruby.taobao.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use response module
gem "responders"

# Access MongoDB
gem 'mongoid', '~> 5.0.0'
gem "bson_ext"

# Paginate
#gem 'will_paginate'
gem 'will_paginate_mongoid'  
# Organizing items as a tree
#gem 'acts_as_tree'  #=>关系型数据库使用
# Static page
gem 'high_voltage', '~> 2.4.0'

# store image to GridFS of mongoDB
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mongoid-grid_fs', '>=1.9.0', github: 'ahoward/mongoid-grid_fs'
gem 'mini_magick', :git => 'git://github.com/probablycorey/mini_magick.git'

# HTML tempelate
gem 'slim'
gem 'slim-rails'
gem 'simple_form' 

# Asset management
gem 'sprockets-rails', '>=2.1.4'
# Use bootstrap 
gem 'bootstrap-sass', '~> 3.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Angular.js
gem 'angularjs-rails'

# Authentication
gem 'cancancan'
gem 'devise' 
gem 'html2slim' #=> erb to slim  run : for file in app/views/devise/**/*.erb; do erb2slim $file ${file%erb}slim && rm $file; done

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


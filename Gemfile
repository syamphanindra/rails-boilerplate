ruby '2.3.8'
Encoding.default_external = Encoding::UTF_8
source 'https://rubygems.org'

group :development, :test do
  gem 'rake', '~> 12.3.2'
  gem 'rails', '3.2.22.5'
  gem 'strong_parameters', '0.2.3' # Used for API params validation
  gem 'mysql2', '~> 0.3.0'
  gem 'json', '1.8.6'
  gem 'jbuilder', '2.2.13'
end

group :production, :staging, :test do
  gem 'test-unit', '3.1.7' # PRE-RAILS: activesupport requires test-unit in staging console boot, need to check for production env.
end
# gem 'lhm', git: 'git://github.com/freshdesk/large-hadron-migrator.git' #Used to run or alter table in real time
group :test, :development do
  # gem 'pry'
  # gem 'pry-byebug'
  gem 'byebug', '11.0.1'

  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-nav'
  gem 'binding_of_caller'
end

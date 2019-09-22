require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'devise'
require "capybara/rspec"
require "database_cleaner"

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  config.after do |example|
    if example.metadata[:type] == :feature
    # save_and_open_page
    save_and_open_screenshot
    end
  end
  # This block must be here, do not combine with the other `before(:each)` block.
    # This makes it so Capybara can see the database.
    # config.before(:each) do
    #     DatabaseCleaner.start
    # ends
    # This block makes sure that tests start on a clean slate
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
    # This block configures Caypbara's driver to use Selenium
    # It makes it use the chrome browser, but can also be configured to user Firefox, etc.
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
    # Uncomment to use capybara-webkit driver for headless testing
    # Capybara.javascript_driver = :webkit
    # Capybara.run_server = false
    # Capybara.app_host = "https://my-website.mysite.com"
  Capybara.configure do |config|
    config.default_max_wait_time = 4 #seconds
    config.default_driver = :selenium
    # config.always_include_port = true
  end


end

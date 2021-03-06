require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|

  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include ControllerMacros, type: :controller
  config.include FactoryBot::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  OmniAuth.config.test_mode = true
  config.include OmniauthMacros
end

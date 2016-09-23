# include ActionDispatch::TestProcess

RSpec.configure do |config|

  config.after(:all) do
    if Rails.env.test?
      test_uploads = Dir["#{Rails.root}/test_uploads"]
      FileUtils.rm_rf(test_uploads)
    end
  end

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  # config.before(:suite) do
  #   begin
  #     EphemeralResponse.activate
  #     DatabaseCleaner.strategy = :truncation
  #     DatabaseCleaner.clean_with(:truncation)
  #     DatabaseCleaner.start
  #     # FactoryGirl.lint
  #   ensure
  #     DatabaseCleaner.clean
  #   end
  # end

  config.before(:all) do
    FactoryGirl.reload
  end

  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end

  # config.after(:suite) do
  #   EphemeralResponse.deactivate
  # end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10
  config.order = :random

  Kernel.srand config.seed

  config.shared_context_metadata_behavior = :apply_to_host_groups
end


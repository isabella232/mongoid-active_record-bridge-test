# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  # Limit a spec run to individual examples or groups you care about by tagging
  # them with `:focus` metadata.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Allow more verbose output when running an individual spec file.
  config.default_formatter = 'doc' if config.files_to_run.one?

  # Run specs in random order to surface order dependencies.
  config.order = :random
  Kernel.srand config.seed

  # Alias "it should behave like" to 2.13-like syntax.
  config.alias_it_should_behave_like_to 'expect_behavior', 'has behavior'

  # rspec-expectations config goes here.
  config.expect_with :rspec do |expectations|
    # This option makes the `description` and `failure_message` of custom
    # matchers include text for helper methods defined using `chain`.
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true

    # Enable only the newer, non-monkey-patching expect syntax.
    expectations.syntax = :expect
  end

  # rspec-mocks config goes here.
  config.mock_with :rspec do |mocks|
    # Enable only the newer, non-monkey-patching expect syntax.
    mocks.syntax = :expect

    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended.
    mocks.verify_partial_doubles = true
  end
end

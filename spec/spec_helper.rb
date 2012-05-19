Bundler.setup

RSpec.configure do |config|
  config.filter_run(focus: true)
  config.run_all_when_everything_filtered = true
end

RSpec::Matchers.define :match do |expected|
  match do |actual|
    actual.matches?(expected)
  end
end

module FixtureHelpers
  def open_fixture(name)
    File.open(Rails.root.join("spec/fixtures", name))
  end
end

RSpec.configure do |config|
  config.include FixtureHelpers
end

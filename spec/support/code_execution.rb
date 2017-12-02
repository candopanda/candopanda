require "codepanda/server"

RSpec.configure do |config|
  config.before(:suite) do
    fork { Codepanda::Server.init.run }
  end
end

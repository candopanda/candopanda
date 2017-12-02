require "codepanda/server"

RSpec.configure do |config|
  config.add_setting :codepanda_pid

  config.before(:suite) do
    RSpec.configuration.codepanda_pid = fork { Codepanda::Server.init.run }
  end

  config.after(:suite) do
    Process.kill 9, RSpec.configuration.codepanda_pid
  end
end

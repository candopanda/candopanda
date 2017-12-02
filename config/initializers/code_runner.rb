CODE_RUNNER = ConnectionPool::Wrapper.new(
  size: ENV.fetch("CODE_EXECUTOR_POOL_SIZE", 5),
  timeout: ENV.fetch("CODE_EXECUTOR_TIMEOUT", 3)
) { Codepanda::Client.new }

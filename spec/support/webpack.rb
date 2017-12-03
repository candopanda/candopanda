RSpec.configure do |config|
  config.before(:suite) do
    puts "Webpack compiled"
    Webpacker.compile
  end
end

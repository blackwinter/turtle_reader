$:.unshift('lib') unless $:.first == 'lib'

require 'turtle_reader'

RSpec.configure { |config|
  config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }

  config.include(Module.new {
    def data(file)
      File.join(File.dirname(__FILE__), 'data', file)
    end
  })
}

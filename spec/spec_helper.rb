require "rspec"
require "bundler/setup"

require "sep"

module RSpec::Sep
  def self.text
    path = File.expand_path("../support/text", __FILE__)

    File.read(path)
  end
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.color_enabled = true
end

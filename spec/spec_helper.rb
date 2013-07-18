require "rspec"
require "bundler/setup"

require "sep"

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.color_enabled = true
end

require "sep/version"
require "sep/separator"

module Sep
  def self.load(text)
    Separator.new(text)
  end
end

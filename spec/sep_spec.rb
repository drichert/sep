require "spec_helper"

describe Sep do
  describe ".load" do
    subject { Sep.load(RSpec::Sep.text) }

    it { should be_a(Sep::Separator) }
  end
end

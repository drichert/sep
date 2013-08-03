require "spec_helper"

describe Sep::Separator do
  let(:text) { RSpec::Sep.text }

  let(:sep) { described_class.new(text) }

  describe "#original_text" do
    subject { sep.original_text }

    it { should be_a(String) }
  end

  describe "#words_data" do
    let(:words) { described_class.new(text).words_data }

    subject { words }

    it { should be_an(Array) }

    describe "element" do
      subject { words.first }

      it { should be_a(Hash) }

      describe "keys" do
        specify ":punc_pre, :word, :punc_post, :space_post" do
          # Convoluted example description parsing
          keys = example.metadata[:description_args][0]
                        .split(/, :|:/)
                        .reject(&:empty?)

          subject.keys.should include(*keys.map(&:to_sym))
        end
      end
    end
  end
end

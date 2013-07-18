require "spec_helper"

describe Sep::Separator do
  let(:text) do 
    path = File.expand_path("../support/text", __FILE__)
    File.read(path)
  end

  describe "#source" do
    subject { described_class.new(text).source }

    it { should be_a(String) }
  end

  describe "#separate" do
    let(:words) { described_class.new(text).separate }
  
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

      #describe "values" do
      #  it "check" do
      #    words.first[:punc_pre
      #  end
      #end
    end
  end
end

module Sep
  class Separator
    attr_reader :original_text, :words_data

    ANALYSIS = /([[:punct:]\s]*)(\w+)([[:punct:]]*)(\s*)/

    # text - String text to separate
    def initialize(text)
      @original_text = text

      analyze
    end

    private

    def scanned_text
      original_text.scan(ANALYSIS)
    end

    def analyze
      @words_data ||= scanned_text.map do |word_data|
        { punc_pre:   word_data[0],
          word:       word_data[1],
          punc_post:  word_data[2],
          space_post: word_data[3]
        }
      end
    end
  end
end

module Sep
  class Separator
    attr_reader :text, :words_data

    ANALYSIS = /([[:punct:]\s]*)(\w+)([[:punct:]]*)(\s*)/

    # text - String text to separate
    def initialize(text)
      @text = text

      analyze
    end

    def leading_space
      text.match(/(\s*)/).captures[0]
    end

    def space
      [leading_space] + words_data.map {|wd| wd[:space_post] }
    end

    def words
      words_data.map {|wd| wd[:word] }
    end

    private

    def scanned_text
      text.scan(ANALYSIS)
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

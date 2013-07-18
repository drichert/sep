module Sep
  class Separator
    attr_reader :source

    #PUNC_RE  = /^(?<pre>[[:punct]\s]+)(\w+)(?<post>[[:punct]]+)$/
    #SPACE_RE = /^(?<pre>\s+)(\w+)(?<post>\s+)$/
    SEPARATE_RE = /([[:punct:]\s]*)(\w+)([[:punct:]]*)(\s*)/

    # str - String text to separate
    def initialize(str)
      @source = str
    end

    def separate
      @separated ||= source.scan(SEPARATE_RE).map do |data|
        { punc_pre:   data[0], 
          word:       data[1], 
          punc_post:  data[2],
          space_post: data[3]
        }
      end
    end

    def unseperate
    end

    # Look up word and return hash of associated data
    #
    # word    -
    # options -
    #   :strict - Boolean, true - match exactly, false - disregard leading
    #             and trailing space, punctuation, and capitalization
    #
    # Example:
    #
    #
    # Returns Array of word data hashes for all occurences of word
    def find(word, options = {})
      { word:  word,
        space: parse_space(word),
        punc:  parse_punc(word)
      }.merge(options)
    end

    private 

    def parse(str)
      scan(/([[:punct:]\s]*)(\w+)([[:punct:]]*)(\s*)/)
    end

    #def parse_space(str)
    #  m = SPACE_RE.match(str)

    #  { pre:  m[:pre], post: m[:post] }
    #end

    #def parse_punc(str)
    #  str.strip!
    #  m = PUNC_RE.match(str)

    #  { pre:  m[:pre], post: m[:post] }
    #end
  end
end

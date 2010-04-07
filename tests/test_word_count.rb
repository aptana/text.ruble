require 'test/unit'
require 'word_count'

class WordCountTest < Test::Unit::TestCase
  def test_word_count
    input =<<EOL
Testing how many words 
are in this "document".

There's not too many here.

Oh well.
EOL
    cmd = $commands['Statistics for Document / Selection (Word Count)']
    assert_equal("          7 lines\n         15 words\n         86 bytes\n", cmd.execute(input))
  end
end
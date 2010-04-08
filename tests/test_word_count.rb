require 'test/unit'
require 'word_count'

class WordCountTest < Test::Unit::TestCase
  
  def setup
    @cmd = $commands['Statistics for Document / Selection (Word Count)']
    @context = CommandContext.new
  end
  
  def teardown
    @cmd = nil
    @context = nil
  end
  
  def test_word_count
    input =<<EOL
Testing how many words 
are in this "document".

There's not too many here.

Oh well.
EOL
    assert_equal("          7 lines\n         15 words\n         86 bytes\n", @cmd.execute(input, @context))
    assert_equal(:show_as_tooltip, @context.output)
  end
end
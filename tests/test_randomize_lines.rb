require 'test/unit'
require 'randomize_lines_in_document_selection'

class RandomizeLinesTest < Test::Unit::TestCase
  def test_word_count
    input =<<EOL
Testing randomizing the lines that 
are in this "document".

There's not too many here.

Oh well.
EOL
    cmd = $commands['Randomize Lines in Document / Selection']
    result = cmd.execute(input)
    assert_not_equal(input, result)
    result_lines = result.lines.to_a
    assert_equal(input.lines.to_a.size, result_lines.size)
    result_lines.each do |line|
      assert input.lines.to_a.include? line
    end    
  end
end
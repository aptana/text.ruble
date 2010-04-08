require 'command_testcase'
require 'randomize_lines_in_document_selection'

class RandomizeLinesTest < CommandTestCase
  
  def command_name
    'Randomize Lines in Document / Selection'
  end
  
  def test_word_count
    input =<<EOL
Testing randomizing the lines that 
are in this "document".

There's not too many here.

Oh well.
EOL
    result = cmd.execute(input, context)
    assert_not_equal(input, result)
    assert_equal(:replace_selection, context.output)
    result_lines = result.lines.to_a
    assert_equal(input.lines.to_a.size, result_lines.size)
    result_lines.each do |line|
      assert input.lines.to_a.include? line
    end    
  end
end
require 'command_testcase'
require 'strip_trailing_spaces'

class StripTrailingSpaces < CommandTestCase
  
  def command_name
    'Remove Trailing Spaces in Document / Selection'
  end
  
  def test_strip_trailing_spaces
    input =<<EOL
Here's some fake lines            
with a lot of trailing spaces after each.                   
EOL
    assert_equal("Here's some fake lines\nwith a lot of trailing spaces after each.\n", cmd.execute(input, context))
    assert_equal(:replace_selection, context.output)
  end
end
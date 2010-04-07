require 'test/unit'
require 'strip_trailing_spaces'

class StripTrailingSpaces < Test::Unit::TestCase
  def test_strip_trailing_spaces
    input =<<EOL
Here's some fake lines            
with a lot of trailing spaces after each.                   
EOL
    cmd = $commands['Remove Trailing Spaces in Document / Selection']
    assert_equal("Here's some fake lines\nwith a lot of trailing spaces after each.\n", cmd.execute(input))
  end
end
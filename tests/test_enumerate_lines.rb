require 'test/unit'
require 'enumerate_lines'

class EnumerateLinesTest < Test::Unit::TestCase
  def test_enumerate_lines
    input =<<EOL
Testing that we append 
line numbers to this "document".

There's not too many here.

Oh well.

We
should
at least
try to get
more than 10.
EOL
    expected =<<EOL
       1  Testing that we append 
       2  line numbers to this "document".
       3  
       4  There's not too many here.
       5  
       6  Oh well.
       7  
       8  We
       9  should
      10  at least
      11  try to get
      12  more than 10.
EOL
    cmd = $commands['Add Line Numbers to Document / Selection']
    assert_equal(expected, cmd.execute(input))
  end
end
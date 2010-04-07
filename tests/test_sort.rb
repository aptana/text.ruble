require 'test/unit'
require 'sort'

class SortTest < Test::Unit::TestCase
  def test_sort
    input =<<EOL
1
x
a
3
[
,
EOL
    cmd = $commands['Sort Lines in Document / Selection']
    assert_equal(",\n1\n3\n[\na\nx\n", cmd.execute(input))
  end
end
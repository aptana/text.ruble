require 'test/unit'
require 'sort_uniq'

class SortUniqTest < Test::Unit::TestCase
  def test_sort_uniq
    input =<<EOL
1
x
1
a
3
[
3
,
z
a
EOL
    cmd = $commands['Sort Lines & Remove Duplicates']
    assert_equal(",\n1\n3\n[\na\nx\nz\n", cmd.execute(input))
  end
end
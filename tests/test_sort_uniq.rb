require 'command_testcase'
require 'sort_uniq'

class SortUniqTest < CommandTestCase
  
  def command_name
    'Sort Lines & Remove Duplicates'
  end
  
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
    assert_equal(",\n1\n3\n[\na\nx\nz\n", cmd.execute(input, context))
    assert_equal(:replace_selection, context.output)
  end
end
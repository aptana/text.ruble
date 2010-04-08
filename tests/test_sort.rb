require 'test/unit'
require 'sort'

class SortTest < Test::Unit::TestCase
  
  def setup
    @cmd = $commands['Sort Lines in Document / Selection']
    @context = CommandContext.new
  end
  
  def teardown
    @cmd = nil
    @context = nil
  end
  
  def test_sort
    input =<<EOL
1
x
a
3
[
,
EOL
    assert_equal(",\n1\n3\n[\na\nx\n", @cmd.execute(input, @context))
    assert_equal(:replace_selection, @context.output)
  end
end
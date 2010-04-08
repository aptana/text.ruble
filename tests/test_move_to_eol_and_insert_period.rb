require 'command_testcase'
require 'move_to_eol_and_insert_period'

class MoveToEOLAndInsertPeriodTest < CommandTestCase
  
  def command_name
    'Move to EOL and Insert "."'
  end
  
  def test_insert_period
    assert_equal("end of line.", cmd.execute("end of line", context))
    assert_equal(:replace_selection, context.output)
  end
end
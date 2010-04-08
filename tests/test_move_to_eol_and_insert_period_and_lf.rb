require 'command_testcase'
require 'move_to_eol_and_insert_period_and_lf'

class MoveToEOLAndInsertPeriodAndLFTest < CommandTestCase
  
  def command_name
    'Move to EOL and Insert "." + LF'
  end
  
  def test_insert_period_and_lf
    assert_equal("end of line.\n", cmd.execute("end of line", context))
    assert_equal(:replace_selection, context.output)
  end
end
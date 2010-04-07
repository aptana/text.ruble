require 'test/unit'
require 'move_to_eol_and_insert_period_and_lf'

class MoveToEOLAndInsertPeriodAndLFTest < Test::Unit::TestCase
  def test_insert_period_and_lf
    cmd = $commands['Move to EOL and Insert "." + LF']
    assert_equal("end of line.\n", cmd.execute("end of line"))
  end
end
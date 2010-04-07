require 'test/unit'
require 'move_to_eol_and_insert_period'

class MoveToEOLAndInsertPeriodTest < Test::Unit::TestCase
  def test_insert_period
    cmd = $commands['Move to EOL and Insert "."']
    assert_equal("end of line.", cmd.execute("end of line"))
  end
end
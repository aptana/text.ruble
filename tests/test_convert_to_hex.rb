require 'test/unit'
require 'convert_to_hex'

class ConvertToHexTest < Test::Unit::TestCase
  def test_14
    cmd = $commands["Convert Character / Selection to Hex"]
    assert_equal("0x31 0x34", cmd.execute("14"))
  end
end
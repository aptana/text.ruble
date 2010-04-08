require 'command_testcase'
require 'convert_to_hex'

class ConvertToHexTest < CommandTestCase
  
  def command_name
    "Convert Character / Selection to Hex"
  end
  
  def test_14
    assert_equal("0x31 0x34", cmd.execute("14", context))
    assert_equal(:replace_selection, context.output)
  end
end
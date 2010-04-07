require 'test/unit'
require 'convert_to_ascii'

class ConvertToAsciiTest < Test::Unit::TestCase
  def test_thing
    cmd = $commands["Transliterate Word / Selection to ASCII"]
    assert_equal("hello world!\n", cmd.execute("hello world!"))
  end
end
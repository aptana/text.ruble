require 'test/unit'
require 'convert_to_ascii'

class ConvertToAsciiTest < Test::Unit::TestCase
  
  def setup
    @cmd = $commands["Transliterate Word / Selection to ASCII"]
    @context = CommandContext.new
  end
  
  def teardown
    @cmd = nil
    @context = nil
  end
  
  def test_thing
    assert_equal("hello world!\n", @cmd.execute("hello world!", @context))
    assert_equal(:replace_selection, @context.output)
  end
end
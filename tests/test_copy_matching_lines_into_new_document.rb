require 'test/unit'
require 'copy_matching_lines_into_new_document'

class CopyMatchingLinesIntoNewDocumentTest < Test::Unit::TestCase
  
  def setup
    @cmd = $commands['Copy Matching Lines into New Document']
    @context = CommandContext.new
  end
  
  def teardown
    @cmd = nil
    @context = nil
  end
  
  def test_nil
    assert_equal(nil, @cmd.execute("", @context))
    assert_equal(:discard, @context.output)
  end
  
  def test_pattern
    input =<<EOL
This
These
There
That
Bogus!
Thiamin
Those
EOL
    expected =<<EOL
This
These
There
That
Thiamin
Those
EOL
    Ruble::UI.add_string_for_request("Th*")
    assert_equal(expected, @cmd.execute(input, @context)) 
    assert_equal(:create_new_document, @context.output)  
  end
end
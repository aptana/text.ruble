require 'test/unit'

class CommandTestCase < Test::Unit::TestCase
  
  def setup
    @cmd = $commands[command_name]
    @context = CommandContext.new
  end
  
  def teardown
    @cmd = nil
    @context = nil
  end
  
  attr_reader :cmd, :context
  
  protected
  def command_name
    nil
  end
  
end
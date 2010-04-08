module Ruble
  class UI
    # TODO Allow tests to queue up strings to return
    def self.add_string_for_request(string)
      @@strings ||= []
      @@strings << string
    end
    
    def self.request_string(hash = {})
      @@strings ||= []
      @@strings.shift
    end
  end
end

class CommandContext
  attr_accessor :output
  
  def initialize
    @output = :undefined
  end
  
  def exit_discard
    @output = :discard
    exit(1)
  end
end

class Command
  def initialize(name)
    @name = name
    @hash = {}
  end
  
  def invoke(&block)
    if block_given?
      @hash["invoke"] = block
    else
      @hash["invoke"]
    end
  end
    
  def method_missing(symbol, *args)
    if symbol.to_s.end_with? "="
      @hash[symbol.to_s[0..-2]] = *args
    else
      @hash[symbol.to_s]
    end
  end
  
  def execute(input, context = CommandContext.new)
    if invoke.kind_of? Proc
      require 'stringio'
      
      block = invoke
      $stdin = StringIO.new(input || "")
      $stdout = StringIO.new
      context.output = output.first if context
      begin
        result = block.call(context)
        result || $stdout.string
      rescue SystemExit => e
        # TODO Save the exit code?
        nil
      end
    else
      # This command has a shell script for the invoke, so we need to run that
      # Create tmpfile with the contents of cmd.invoke
      require 'tempfile'

      file = Tempfile.new("ascii")
      File.open(file.path, 'w') {|f| f.puts(invoke) }
      result = IO.popen("/bin/bash -l \"#{file.path}\"", 'r+') do |io|
        if input
          io.puts input
          io.close_write
        end
        io.read
      end
    end
  end   
end

$commands = {}
def command(name, &block)
   command = Command.new(name)
   block.call(command) if block_given?
   $commands[name] = command
end
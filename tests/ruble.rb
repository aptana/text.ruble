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
  
  def execute(input)
    if invoke.kind_of? Proc
      require 'stringio'
      
      block = invoke
      $stdin = StringIO.new(input || "")
      $stdout = StringIO.new("")
      result = block.call || $stdout.string
      result
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
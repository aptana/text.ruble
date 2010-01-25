require 'radrails'

command 'Add Line Numbers to Document / Selection' do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke do
    STDIN.readlines.each_with_index {|line, i| puts "#{sprintf("%8d", i + 1)}  #{line}" }
    nil
  end
end

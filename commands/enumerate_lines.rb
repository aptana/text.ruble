require 'ruble'

command t(:add_line_numbers) do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke do
    $stdin.readlines.each_with_index {|line, i| puts "#{sprintf("%8d", i + 1)}  #{line}" }
    nil
  end
end

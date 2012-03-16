require 'ruble'

command t(:randomize_lines) do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke do
    $stdin.readlines.sort { rand(3) - 1 }.join('')
    #$stdin.readlines.sort_by { rand }.join('')
  end
end

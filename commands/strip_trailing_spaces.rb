require 'radrails'

command 'Remove Trailing Spaces in Document / Selection' do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke do
    STDIN.readlines.each {|l| print l.sub(/[\t ]+$/, '') }
    nil
  end
end

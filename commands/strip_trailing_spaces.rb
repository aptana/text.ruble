require 'radrails'

command 'Remove Trailing Spaces in Document / Selection' do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
perl -pe 's/[\t ]+$//g'
EOF
end

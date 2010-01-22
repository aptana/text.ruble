require 'radrails'
# FIXME Won't work on Windows
command 'Sort Lines in Document / Selection' do |cmd|
  cmd.key_binding = 'F5'
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
sort -f
EOF
end

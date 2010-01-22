require 'radrails'
# FIXME Won't work on Windows
command 'Speak Document / Selection' do |cmd|
  cmd.output = :discard
  cmd.input = :selection
  cmd.invoke =<<-EOF
say `echo "$TM_SELECTED_TEXT"` &
EOF
end

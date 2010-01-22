require 'radrails'
# FIXME Won't work on windows
command 'Add Line Numbers to Document / Selection' do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
cat -n|expand -8
EOF
end

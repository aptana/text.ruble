require 'radrails'
# FIXME Won't work on Windows
command 'Sort Lines & Remove Duplicates' do |cmd|
  cmd.key_binding = 'F5'
  cmd.output = :replace_selection
  cmd.input = :selection
  cmd.invoke =<<-EOF
sort -f|uniq
EOF
end

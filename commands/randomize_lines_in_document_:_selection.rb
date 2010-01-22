require 'radrails'
# FIXME Won't work on Windows
command 'Randomize Lines in Document / Selection' do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
ruby -pe'$_ = (rand * 100000000).round.to_s + "\t" + $_'|sort|cut -f2-
EOF
end

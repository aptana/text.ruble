require 'ruble'

# FIXME This probably won't work on windows
command t(:transliterate_to_ascii) do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :word
  cmd.invoke =<<-EOF
iconv -c -f utf-8 -t ASCII//TRANSLIT
EOF
end

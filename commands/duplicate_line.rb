require 'radrails'

command 'Duplicate Line / Selection' do |cmd|
  cmd.key_binding = 'CONTROL+M2+D'
  cmd.output = :insert_as_text
  cmd.input = :selection, :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby -wKU

# If there’s a selection, output that twice (as a snippet)
# leaving the duplicate as the new selected text.
# Otherwise split the current line around the caret and
# output “right, left” to duplicate the line, leaving the
# caret in the same place on the new line

require File.join(ENV["TM_SUPPORT_PATH"], "lib/exit_codes.rb")
require File.join(ENV["TM_SUPPORT_PATH"], "lib/escape.rb")

if ENV['TM_SELECTED_TEXT'] != nil
	TextMate.exit_insert_snippet(e_sn(ENV['TM_SELECTED_TEXT']) + "${0:" + e_snp(ENV['TM_SELECTED_TEXT']) + "}")
else
	col   = ENV['TM_LINE_INDEX'].to_i
	TextMate.exit_insert_text(ENV['TM_CURRENT_LINE'][col..-1] + "\n" + ENV['TM_CURRENT_LINE'][0...col])
end
EOF
end

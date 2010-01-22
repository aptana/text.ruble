require 'radrails'

command 'Copy Non-Matching Lines into New Document' do |cmd|
  cmd.output = :open_as_new_document
  cmd.input = :selection
  cmd.invoke =<<-EOF
res=$(ruby -rui -e"print TextMate::UI.request_string(:title => 'Filter Non-Matching Lines', :prompt => 'Enter a pattern:', :button1 => 'Filter', :button2 => 'Cancel').to_s")

[[ -z "$res" ]] && exit_discard
export pattern="$res"

# This could be done with grep, but Python's RE is closer to oniguruma
"${TM_PYTHON:-python}" -c '
import sys, os, re, traceback
try:
  pattern = re.compile(os.environ["pattern"])
except re.error, e:
  sys.stderr.write("Invalid pattern: %s" % e)
  sys.exit(1)
for line in sys.stdin:
  if not pattern.search(line):
    sys.stdout.write(line)
' || exit_show_tool_tip

EOF
end

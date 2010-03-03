require 'ruble'

command "Previous Editor" do |cmd|
  cmd.key_binding = "CTRL+SHIFT+TAB"
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke { Ruble::UI.previous_editor }
end

command "Next Editor" do |cmd|
  cmd.key_binding = "CTRL+TAB"
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke { Ruble::UI.next_editor }
end

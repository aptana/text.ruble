require 'radrails'
require 'escape'

command 'Delete Line' do |cmd|
  cmd.key_binding = 'CONTROL+M2+K'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    current_line_number = context.editor.caret_line
    line_offset = context.editor.styled_text.getOffsetAtLine(current_line_number)
    length = context.editor.current_line.length
    if (current_line_number < context.editor.styled_text.line_count - 1)
      length = context.editor.styled_text.getOffsetAtLine(current_line_number + 1) - line_offset
    end
    context.editor[line_offset, length] = ""
  end
end

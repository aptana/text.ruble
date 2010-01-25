require 'radrails'

def pretty(number)
  number.to_s.gsub(/\d{1,3}(?=\d{3}+(?!\d))/, '\0,')
end
# FIXME Tooltip isn't showing properly when input is selection...
# FIXME Won't work on windows, should convert to pure ruby if possible (see http://dada.perl.it/shootout/wc.ruby.html)
command 'Statistics for Document / Selection (Word Count)' do |cmd|
  cmd.key_binding = 'CONTROL+M2+N'
  cmd.output = :show_as_tooltip
  cmd.input = :selection, :document
  cmd.invoke do
    counts = IO.popen('wc -lwc', 'r+') { |io| io.write STDIN.read; io.close_write; io.read }.scan(/\d+/)
    counts[0] = counts[0].to_i + 1 # increase one to the line count
    
    %w[ line word byte ].each do |unit|
      cnt    = counts.shift
      plural = cnt.to_i != 1 ? 's' : ''
      printf("%11.11s %s%s\n", pretty(cnt), unit, plural)
    end
    nil
  end
end

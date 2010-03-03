require 'ruble'
# FIXME Won't work on Windows, or Ubuntu. Run 'espeak' on Ubuntu!
command 'Speak Document / Selection' do |cmd|
  cmd.output = :discard
  cmd.input = :selection, :document
  cmd.invoke do
    # TODO Allow cancelling job in UI to actually stop the process run here!
    job = Ruble::Job.new("Speaking...") { `say \`echo "#{STDIN.read}"\` &` }
    job.schedule
    nil
  end
end

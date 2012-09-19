require "pathname"

# Taken from:
#   https://github.com/rails/rails/blob/c5205041f65206a1490063b08915e7b2a2151a61/actionpack/lib/action_view/helpers/text_helper.rb#L223
def word_wrap(text, line_width = 80)
  text.split("\n").collect do |line|
    line.length > line_width ? line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1\n").strip : line
  end * "\n"
end

commit_message_pathname = Pathname.new(ARGV.first)
wrapped_commit_message = word_wrap(commit_message_pathname.read)
commit_message_pathname.open("w") { |file| file.write(wrapped_commit_message) }

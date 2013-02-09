# Updates Git hooks for multiple Git repositories.

require "pathname"

base_pathname = ARGV[0]
raise(ArgumentError, "no base pathname given") unless base_pathname

base_pathname = Pathname.new(base_pathname)
raise(ArgumentError, "base pathname given (#{base_pathname}) does not exist") unless base_pathname.exist?

puts "Searching for Git repositories in: #{base_pathname}"
git_repository_pathnames = Pathname.glob(base_pathname + "**/.git").map { |pathname| pathname.parent }

# Filter out Git repositories that are "vendored" gems installed by Bundler.
git_repository_pathnames.select! { |pathname| not pathname.to_s.include?("vendor/bundle") }

puts "Found #{git_repository_pathnames.count} Git repositories:"
puts git_repository_pathnames

response = nil
until ["y", "n"].include?(response)
  print "Update Git hooks? [y/n] "
  response = STDIN.gets.downcase.strip
end

exit if response == "n"

git_repository_pathnames.each do |git_repository_pathname|
  puts "Updating Git hooks in: #{git_repository_pathname}"
  Dir.chdir(git_repository_pathname) do
    stdout = `rm -rf .git/hooks`
    puts stdout unless stdout.empty?
    stdout = `git init`
    puts stdout unless stdout.empty?
  end
end

puts "Done!"

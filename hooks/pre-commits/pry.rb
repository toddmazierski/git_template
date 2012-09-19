require File.expand_path("../../lib/commit_file", __FILE__)

CommitFile.all.each do |commit_file|
  commit_file.lines.each do |line|
    if line =~ /binding\.pry/i
      line.alert("binding.pry detected")
    end
  end
end

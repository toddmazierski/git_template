require File.expand_path("../../lib/commit_file", __FILE__)

CommitFile.all.each do |commit_file|
  commit_file.lines.each do |line|
    if line =~ /^<<<<<<<\s\w*|^=======$|^>>>>>>>\s\w*/
      line.alert("merge conflict characters detected")
    end
  end
end

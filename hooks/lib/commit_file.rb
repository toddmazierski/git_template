require "pathname"
require File.expand_path("../line", __FILE__)

class CommitFile
  EXTENSION_BLACKLIST = %w(.png .jpg .gif)

  def self.all
    pathnames.map { |pathname| new(pathname) }
  end

  def self.pathnames
    pathnames = ARGV.map { |argv| Pathname.new(argv) }
    # Return only pathnames for files that exist and aren't on the blacklist.
    pathnames.select { |pathname| pathname.exist? and not blacklisted?(pathname) }
  end

  def self.blacklisted?(pathname)
    EXTENSION_BLACKLIST.include?(pathname.extname)
  end

  def initialize(pathname)
    @pathname = pathname
  end

  def lines
    @pathname.readlines.each_with_index.collect do |line, index|
      Line.new(@pathname, line, index)
    end
  end
end

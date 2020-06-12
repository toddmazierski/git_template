require "pathname"
require File.expand_path("../line", __FILE__)

class CommitFile
  EXTENSION_BLOCKLIST = %w(.png .jpg .gif)

  def self.all
    pathnames.map { |pathname| new(pathname) }
  end

  def self.pathnames
    pathnames = ARGV.map { |argv| Pathname.new(argv) }
    # Return only pathnames for files that exist and aren't on the blocklist.
    pathnames.select { |pathname| pathname.file? and not blocklisted?(pathname) }
  end

  def self.blocklisted?(pathname)
    EXTENSION_BLOCKLIST.include?(pathname.extname)
  end

  def initialize(pathname)
    @pathname = pathname
  end

  def lines
    @pathname.readlines(encoding: 'UTF-8').each_with_index.collect do |line, index|
      Line.new(@pathname, line, index)
    end
  end
end

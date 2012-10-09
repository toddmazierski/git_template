require "pathname"
require File.expand_path("../line", __FILE__)

class CommitFile
  class << self
    def all
      pathnames.map { |pathname| new(pathname) }
    end

    def pathnames
      pathnames = ARGV.map { |argv| Pathname.new(argv) }
      # Return only pathnames for files that exist.
      pathnames.select { |pathname| pathname.exist? }
    end
  end # self

  def initialize(pathname)
    @pathname = pathname
  end

  def lines
    @pathname.readlines.each_with_index.collect do |line, index|
      Line.new(@pathname, line, index)
    end
  end
end # CommitFile

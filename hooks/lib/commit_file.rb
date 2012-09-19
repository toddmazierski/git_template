require "pathname"
require File.expand_path("../line", __FILE__)

class CommitFile
  class << self
    def all
      pathnames.map { |pathname| new(pathname) }
    end

    def pathnames
      ARGV.map { |argv| Pathname.new(argv) }
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

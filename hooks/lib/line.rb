require "forwardable"

class Line
  extend Forwardable

  attr_accessor :line
  def_delegators :line, :=~

  def initialize(pathname, line, index)
    @pathname = pathname
    @line = line
    @index = index
  end

  def number
    @index + 1
  end

  def alert(message)
    puts "#{@pathname}:#{number}: #{message}."
    exit 1
  end
end #Line

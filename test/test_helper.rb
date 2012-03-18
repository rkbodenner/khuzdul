require 'rubygems'
require 'test/unit'
require 'treetop'

module TestHelper
  def do_parse(input)
    @parser.parse(input)
  end

  def parse(input)
    result = do_parse(input)
    unless result
      puts @parser.terminal_failures.join("\n")
    end
    assert !result.nil?
    result
  end

  def fail_parse(input)
    result = do_parse(input)
    assert result.nil?
    result
  end
end

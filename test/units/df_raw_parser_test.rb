require 'rubygems'
require 'test/unit'
require 'treetop'

dir = File.dirname(__FILE__)
require "test_helper"

Treetop.load File.expand_path("#{dir}/../../lib/khuzdul/df_raw")

class DfRawParserTest < Test::Unit::TestCase
  include TestHelper

  def setup
    @parser = DfRawParser.new
  end

  def test_int
    @parser.root = 'int'
    parse('12345')
    fail_parse('1:2:')
  end

  def test_rgb
    @parser.root = 'rgb'
    parse('1:2:3')
    fail_parse('1:2:')
  end

  def test_comment
    @parser.root = 'cmnt'
    parse('This is a comment, it contains (parens)/other punctuation--\r\nbut no opening brackets.')
    fail_parse('This is a comment and also [AN_ATTRIBUTE]')
  end
  
  def test_obj_def
    @parser.root = 'obj_def'
    text = <<EOT
temperature values unknown, used nickel
[MATGLOSS_METAL:NICKEL_SILVER]
[NAME:nickel silver][ADJ:nickel silver][COLOR:7:7:1]
[VALUE:3]
[SPEC_HEAT:444]
[MELTING_POINT:12619]
[BOILING_POINT:15243]
[SOLID_DENSITY:8650]

EOT
    parse(text)
  end

  def test_raw_file
    @parser.root = 'raw_file'
    text = <<EOT
matgloss_metal

[OBJECT:MATGLOSS]

[MATGLOSS_METAL:IRON]
[NAME:iron][ADJ:iron][COLOR:0:7:1]
[VALUE:10]
[SPEC_HEAT:450]
[MELTING_POINT:12768]
[BOILING_POINT:15150]
[WEAPON][WEAPON_RANGED][AMMO][DIGGER][ARMOR][ANVIL]
[DAMAGE_PERC:100]
[BLOCK_PERC:100]
[SOLID_DENSITY:7850]

EOT
    parse(text)
  end
end

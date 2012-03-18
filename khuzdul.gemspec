require "lib/khuzdul/version"
$gemspec = Gem::Specification.new do |s|
  s.name = "khuzdul"
  s.version = Khuzdul::VERSION::STRING
  s.author = "Ralph Bodenner"
  s.email = "rkbodenner@gmail.com"
  s.homepage = "http://bodenner.net"
  s.platform = Gem::Platform::RUBY
  s.summary = "Ruby parser for Dwarf Fortress raw data files"
  s.description = s.summary + <<EOD
For details on the Dwarf Fortress game, see http://www.bay12games.com/
EOD
  s.files = ["LICENSE", "README.md", "Rakefile", "{test,lib}/**/*"].map{|p| Dir[p]}.flatten
  s.require_path = "lib"
  s.has_rdoc = false
  s.add_dependency "treetop"
end

require "echoe"

Echoe.new( "helpful_utils" ) do |p|
  p.author =          [ "Ilya Vesov","Anatoly Lapshin"]
  p.summary =         "collection of helpful utils,hacks , etc"
  p.email =           "strikeroff@gmail.com"
  p.url =             "http://github.com/strikeroff/helpful_utils"

  p.runtime_dependencies = ['activesupport']
  p.development_dependencies = []
  
  p.need_tar_gz =     false
  p.retain_gemspec =  true
  p.gemspec_name =    'heplful_utils.gemspec'
  p.test_pattern =    ["test/**/*_test.rb"]

  p.clean_pattern.push 'lib/*-*'
  p.has_rdoc =        true
  p.rdoc_pattern =    ["README", "CHANGELOG", "lib/**/*.rb"]
  p.rdoc_options <<   "-c utf-8"
  p.ignore_pattern =  [".gitignore", "doc", "examples", ".idea", "coverage.data", "*.bat"]
end
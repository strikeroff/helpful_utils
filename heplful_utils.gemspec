# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{helpful_utils}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ilya Vesov, Anatoly Lapshin"]
  s.date = %q{2009-09-10}
  s.description = %q{collection of helpful utils,hacks , etc}
  s.email = %q{strikeroff@gmail.com}
  s.extra_rdoc_files = ["CHANGELOG", "README", "lib/helpful_utils.rb", "lib/helpful_utils/activerecord_ext/humanized_attributes.rb", "lib/helpful_utils/common/configuration.rb", "lib/helpful_utils/core_ext/array.rb", "lib/helpful_utils/core_ext/hash.rb", "lib/helpful_utils/core_ext/kernel.rb", "lib/helpful_utils/core_ext/string.rb", "lib/helpful_utils/patching_utils/event_machine.rb", "lib/helpful_utils/patching_utils/inheritance_tree.rb"]
  s.files = ["CHANGELOG", "gem-build.sh", "heplful_utils.gemspec", "Manifest", "Rakefile", "README", "lib/helpful_utils.rb", "lib/helpful_utils/activerecord_ext/humanized_attributes.rb", "lib/helpful_utils/common/configuration.rb", "lib/helpful_utils/core_ext/array.rb", "lib/helpful_utils/core_ext/hash.rb", "lib/helpful_utils/core_ext/kernel.rb", "lib/helpful_utils/core_ext/string.rb", "lib/helpful_utils/patching_utils/event_machine.rb", "lib/helpful_utils/patching_utils/inheritance_tree.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/strikeroff/helpful_utils}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Helpful_utils", "--main", "README", "-c utf-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{helpful_utils}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{collection of helpful utils,hacks , etc}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end

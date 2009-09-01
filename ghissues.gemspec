# -*- encoding: utf-8 -*-


Gem::Specification.new do |s|
  s.name = %q{ghissues}
  s.version = '0.1.2' # SADNESS. DUPLICATE VALUE

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Britt"]
  s.date = %q{2009-09-01}
  s.default_executable = %q{ghissues}
  s.description = %q{CLI app to interact with GitHub 'issues' API}
  s.email = %q{james@neurogami.com}
  s.executables = ["ghissues"]
  s.extra_rdoc_files = ["History.txt", "README.markdown", "bin/ghissues"]
  s.files = [ "History.txt", "README.markdown", "Rakefile", "bin/ghissues", "lib/ghissues.rb",  "lib/version.rb", 
              "lib/ghissues/ghissues.rb", "spec/ghissues_spec.rb", "spec/spec_helper.rb", "test/test_ghissues.rb"]
  s.homepage = %q{http://github.com/Neurogami/ghissues/tree/master}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ghissues}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{CLI app to interact with GitHub 'issues' API}
  s.test_files = ["test/test_ghissues.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 2.5.0"])
    else
      s.add_dependency(%q<bones>, [">= 2.5.0"])
    end
  else
    s.add_dependency(%q<bones>, [">= 2.5.0"])
  end
end

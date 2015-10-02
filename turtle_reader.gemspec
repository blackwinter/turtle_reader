# -*- encoding: utf-8 -*-
# stub: turtle_reader 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "turtle_reader"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jens Wille"]
  s.date = "2015-10-02"
  s.description = "A convenience wrapper for reading RDF Turtle data."
  s.email = "jens.wille@gmail.com"
  s.extra_rdoc_files = ["README", "COPYING", "ChangeLog"]
  s.files = ["COPYING", "ChangeLog", "README", "Rakefile", "lib/turtle_reader.rb", "lib/turtle_reader/rdf/compression.rb", "lib/turtle_reader/rdf/prefix.rb", "lib/turtle_reader/rdf/turtle/reader.rb", "lib/turtle_reader/rdf/uri.rb", "lib/turtle_reader/version.rb", "spec/data/GND-sample.ttl", "spec/data/GND-sample.ttl.bz2", "spec/data/GND-sample.ttl.gz", "spec/spec_helper.rb", "spec/turtle_reader_spec.rb"]
  s.homepage = "http://github.com/blackwinter/turtle_reader"
  s.licenses = ["AGPL-3.0"]
  s.post_install_message = "\nturtle_reader-0.1.0 [2015-10-02]:\n\n* Some refactoring.\n\n"
  s.rdoc_options = ["--title", "turtle_reader Application documentation (v0.1.0)", "--charset", "UTF-8", "--line-numbers", "--all", "--main", "README"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.4.8"
  s.summary = "RDF Turtle reader."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rdf-turtle>, ["<= 1.1.7", "~> 1.1"])
      s.add_development_dependency(%q<rbzip2>, [">= 0"])
      s.add_development_dependency(%q<hen>, [">= 0.8.3", "~> 0.8"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rdf-turtle>, ["<= 1.1.7", "~> 1.1"])
      s.add_dependency(%q<rbzip2>, [">= 0"])
      s.add_dependency(%q<hen>, [">= 0.8.3", "~> 0.8"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rdf-turtle>, ["<= 1.1.7", "~> 1.1"])
    s.add_dependency(%q<rbzip2>, [">= 0"])
    s.add_dependency(%q<hen>, [">= 0.8.3", "~> 0.8"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end

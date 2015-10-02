require_relative 'lib/turtle_reader/version'

begin
  require 'hen'

  Hen.lay! {{
    gem: {
      name:         %q{turtle_reader},
      version:      TurtleReader::VERSION,
      summary:      %q{RDF Turtle reader.},
      description:  %q{A convenience wrapper for reading RDF Turtle data.},
      author:       %q{Jens Wille},
      email:        %q{jens.wille@gmail.com},
      license:      %q{AGPL-3.0},
      homepage:     :blackwinter,
      dependencies: { 'rdf-turtle' => ['~> 1.1', '<= 1.1.7'] },

      development_dependencies: %w[rbzip2],

      required_ruby_version: '>= 1.9.3'
    }
  }}
rescue LoadError => err
  warn "Please install the `hen' gem. (#{err})"
end

describe TurtleReader do

  context 'GND' do

    let(:ttl) { data('GND-sample.ttl') }

    example do
      prefixes = { nil => '' }

      prefixes.update(
        dc:       'http://purl.org/dc/elements/1.1/',
        gnd:      'http://d-nb.info/standards/elementset/gnd#',
        rda:      'http://rdvocab.info/',
        foaf:     'http://xmlns.com/foaf/0.1/',
        isbd:     'http://iflastandards.info/ns/isbd/elements/',
        dcterms:  'http://purl.org/dc/terms/',
        rdfs:     'http://www.w3.org/2000/01/rdf-schema#',
        marcRole: 'http://id.loc.gov/vocabulary/relators/',
        lib:      'http://purl.org/library/',
        umbel:    'http://umbel.org/umbel#',
        bibo:     'http://purl.org/ontology/bibo/',
        owl:      'http://www.w3.org/2002/07/owl#',
        rdf:      'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
        skos:     'http://www.w3.org/2004/02/skos/core#'
      ) unless RUBY_PLATFORM == 'java'

      TurtleReader.open(ttl) { |r| r.prefixes }.map { |k, v| [k, v.to_s]}
      .sort_by { |k,| k.to_s }.should == prefixes.sort_by { |k,| k.to_s }
    end

    example do
      TurtleReader.open(ttl) { |r| r.statements.first.to_a }.map(&:to_s).should == %w[
        http://d-nb.info/gnd/1-2 http://d-nb.info/standards/elementset/gnd#gndIdentifier 1-2
      ]
    end

    example do
      TurtleReader.open(ttl) { |r| r.statements.size }.should == 838
    end

    example do
      TurtleReader.open(ttl + '.gz') { |r| r.statements.size }.should == 838
    end

    if Object.const_defined?(:RBzip2)

      example do
        TurtleReader.open(ttl + '.bz2') { |r| r.statements.size }.should == 838
      end

    end

  end

end

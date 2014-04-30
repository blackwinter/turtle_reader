# encoding: utf-8

#--
###############################################################################
#                                                                             #
# turtle_reader -- RDF Turtle reader                                          #
#                                                                             #
# Copyright (C) 2014 Jens Wille                                               #
#                                                                             #
# Authors:                                                                    #
#     Jens Wille <jens.wille@gmail.com>                                       #
#                                                                             #
# turtle_reader is free software; you can redistribute it and/or modify it    #
# under the terms of the GNU Affero General Public License as published by    #
# the Free Software Foundation; either version 3 of the License, or (at your  #
# option) any later version.                                                  #
#                                                                             #
# turtle_reader is distributed in the hope that it will be useful, but        #
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY  #
# or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public      #
# License for more details.                                                   #
#                                                                             #
# You should have received a copy of the GNU Affero General Public License    #
# along with turtle_reader. If not, see <http://www.gnu.org/licenses/>.       #
#                                                                             #
###############################################################################
#++

require_relative 'turtle_reader/rdf/turtle/reader'
require_relative 'turtle_reader/rdf/compression'
require_relative 'turtle_reader/rdf/prefix'
require_relative 'turtle_reader/rdf/uri'

class TurtleReader

  include Enumerable

  NS = RDF::Vocabulary.inject({}) { |h, v| h[v.__prefix__] = v; h }

  class << self

    def open(file, *args)
      RDF::Reader.open(file, format: :ttl) { |reader|
        turtle = new(reader, *args)
        turtle.file = File.expand_path(file)

        return block_given? ? yield(turtle) : turtle
      }
    end

    def foreach(file, *args, &block)
      open(file, *args) { |turtle| turtle.each(&block) }
    end

  end

  def initialize(reader, map = true)
    @reader, @base, @prefixes = reader, *reader.parse_prologue
    self.map = map
  end

  attr_reader :reader, :map, :base, :prefixes

  attr_accessor :file

  def map=(map)
    unless map.is_a?(Hash)
      @map = Hash.new(map)
    else
      @map = {}

      map.each { |k, v|
        if k.is_a?(String)
          n, s = k.split(':', 2)
          k = NS.key?(n = n.to_sym) ? NS[n][s] : prefixes[n] / s
        end

        @map[k] = v
      }
    end
  end

  def statements
    each_statement.to_a
  end

  def each_statement(&block)
    return enum_for(:each_statement) unless block_given?
    reader.parse_statements(&block)
    self
  end

  def each
    return enum_for(:each) unless block_given?

    uri, map, base = RDF::URI, self.map, self.base

    each_statement { |t|
      s, p, o = *t

      if s.is_a?(uri) and k = map[p] and s.start_with?(base)
        yield s, o, k
      end
    }
  end

  def closed?
    reader.closed?
  end

  def inspect
    '#<%s:0x%x @file=%p, @base=%p%s>' % [
      self.class, object_id, file, base, closed? ? ' (closed)' : ''
    ]
  end

end

require_relative 'turtle_reader/version'

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

require 'rdf/turtle'

module RDF
  class Turtle::Reader

    PARSE_OPTIONS = {
      branch:         BRANCH,
      first:          FIRST,
      follow:         FOLLOW,
      reset_on_start: true,

      # NoMethodError: undefined method `[]' for nil:NilClass (line 17) [GND-sample.ttl]
      # from .../lib/ruby/gems/shared/gems/rdf-turtle-1.1.3.1/lib/rdf/turtle/reader.rb:153
      progress:       RUBY_PLATFORM == 'java'
    }

    def closed?
      @input.closed?
    end

    def parse_prologue
      parse_internal { break }
      rewind
      [base_uri, prefixes]
    end

    def parse_statements
      parse_internal { |context, _, *data|
        if context == :statement
          data[3] = { context: data[3] }
          yield Statement.new(*data)
        end
      }
    end

    private

    def parse_internal(&block)
      parse(@input, START, @options.merge(PARSE_OPTIONS), &block)
    rescue => err
      err.message << " (line #{lineno})"
      raise
    end

  end
end

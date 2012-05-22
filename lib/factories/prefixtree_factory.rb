#!/usr/bin/env ruby -w

require_relative 'camelcriteria_factory'
require_relative 'digitfence_factory'
require_relative 'prefixfence_factory'
 
 
module Alcatel
 
  # responsible for turning entries obtained from EDW into objects
  class PrefixTreeFactory
 
    attr_accessor :prefixfence, :digitfence, :camelcriteria
 
    def initialize prefixtree_data
      @prefixfence = PrefixFenceFactory.create prefixtree_data.prefixfence
      @digitfence = DigitFenceFactory.create prefixtree_data.digitfence
      @camelcriteria = CamelCriteriaFactory.create prefixtree_data.camelcriteria
    end

  end
end
 
 
if __FILE__ == $0 
  require_relative '../loaders/prefixtree_loader'
  loader = Alcatel::PrefixTreeLoader.new ARGV[0], ARGV[1]
  factory = Alcatel::PrefixTreeFactory.new loader
  puts factory.prefixfence.size
  puts factory.digitfence.size
  puts factory.camelcriteria.size
end
 
 

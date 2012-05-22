#!/usr/bin/env ruby -w

require_relative './loaders/prefixtree_loader'
require_relative './factories/prefixtree_factory'
require_relative './mappers/prefixtree_mapper'

 
module Alcatel
 
  module PrefixTreeBuilder
 
    def self.prefixtree_entries mss_name, prefix_tree
      edw_data = PrefixTreeLoader.new mss_name, prefix_tree
      objects = PrefixTreeFactory.new edw_data
      PrefixTreeMapper.join objects
    end
 
  end
end

 
if __FILE__ == $0 
  prefixfence = Alcatel::PrefixTreeBuilder.prefixtree_entries ARGV[0], ARGV[1]
  puts prefixfence.size
  prefixfence.each do |pf|
    puts pf.to_key
    p pf.digitfence
    p pf.camelcriteria
  end
end
 
 

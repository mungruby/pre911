#!/usr/bin/env ruby -w

require_relative 'camelcriteria_mapper'
require_relative 'digitfence_mapper'
 
 
module Alcatel
 
  module PrefixTreeMapper
 
    #
    # joins digitfence data and camel criteria data to prefixfence data
    #
    def self.join prefix_data
      DigitFenceMapper.join prefix_data.prefixfence, prefix_data.digitfence
      CamelCriteriaMapper.join prefix_data.prefixfence, prefix_data.camelcriteria
      prefix_data.prefixfence
    end
  end
end
 
 
if __FILE__ == $0 
  require_relative '../loaders/prefixtree_loader'
  require_relative '../factories/prefixtree_factory'

  loader = Alcatel::PrefixTreeLoader.new ARGV[0], ARGV[1]
  factory = Alcatel::PrefixTreeFactory.new loader
  prefixfence = Alcatel::PrefixTreeMapper.join factory

  puts prefixfence.size
  # prefixfence.each do |pf|
  #   # puts pf.to_key
  #   p pf.digitfence
  #   p pf.camelcriteria
  # end
end
 
 

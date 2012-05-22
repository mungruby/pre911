#!/usr/bin/env ruby -w

require_relative 'prefixfence_loader'
require_relative 'digitfence_loader'
require_relative 'camelcriteria_loader'


module Alcatel

  class PrefixTreeLoader

    attr_accessor :mss_name, :prefix_tree, :prefixfence, :digitfence, :camelcriteria

    def initialize mss_name, prefix_tree
      @mss_name = mss_name.upcase
      @prefix_tree = prefix_tree
      load_entries_from_edw
    end

    def load_entries_from_edw
      STDERR.puts "Loading Prefix Tree #{prefix_tree} entries from EDW for #{mss_name}."
      @prefixfence = PrefixFenceLoader.new(mss_name, prefix_tree).load_entries_from_edw
      @digitfence = DigitFenceLoader.new(mss_name).load_entries_from_edw
      @camelcriteria = CamelCriteriaLoader.new(mss_name).load_entries_from_edw
    end

  end
end
 
 
if __FILE__ == $0 
  loader = Alcatel::PrefixTreeLoader.new ARGV[0], ARGV[1]
  puts loader.prefixfence.size
  puts loader.digitfence.size
  puts loader.camelcriteria.size
end
 
 

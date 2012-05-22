#!/usr/bin/env ruby -w

require_relative 'prefixtree_builder'


module Alcatel

  class PrefixTree230

    attr_accessor :mss_name, :entries

    def initialize mss_name
      @mss_name = mss_name.upcase
      @prefix_tree = 230
      @entries = PrefixTreeBuilder.prefixtree_entries @mss_name, @prefix_tree
    end

  end
end
 
 
if __FILE__ == $0 
  tree230 = Alcatel::PrefixTree230.new(ARGV.shift)
  puts tree230.entries.size
  p tree230.entries.first
end
 
 

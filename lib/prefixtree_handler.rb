#!/usr/bin/env ruby -w


require_relative 'prefixtree_builder'

 
module Alcatel
 
  #
  # keeps track of already loaded data so we don't load multiple times for the same mss
  #
  # class PrefixTreeHandler
  module PrefixTreeHandler

    @prefix_trees = Hash.new { |hash, key| hash[key] = {} }

    def self.entries mss_name, prefix_tree
      if values = @prefix_trees[mss_name][prefix_tree]
        values
      else
        @prefix_trees[mss_name][prefix_tree] = PrefixTreeBuilder.prefixtree_entries(mss_name, prefix_tree)
      end
    end

  end
end
 
 
if __FILE__ == $0 
  entries = Alcatel::PrefixTreeHandler.entries "sfmss840", 230
  puts entries.size

  entries = Alcatel::PrefixTreeHandler.entries "vgmss861", 230
  puts entries.size

  entries = Alcatel::PrefixTreeHandler.entries "sfmss840", 230
  puts entries.size
end
 
 

#!/usr/bin/env ruby -w

# require_relative 'prefixtree_handler'


module Alcatel

  class E911Auditor

    attr_accessor :reference_mss, :mss_list, :prefix_tree_entries

    def initialize reference_mss, mss_list, prefix_tree_entries
      @reference_mss = reference_mss
      @mss_list = mss_list
      @prefix_tree_entries = prefix_tree_entries
    end

    def run
      # puts "Comparing #{reference_mss.upcase} with #{mss_list.join(' and ')}."
      # puts prefix_tree_entries[reference_mss].size

      # find_entries_with_local_routing.each do |e|
      #   puts e.digitfence.routeaction
      # end

      route_cases = local_route_cases(find_entries_with_local_routing)
      puts route_cases

      # reference = PrefixTree230.new reference_mss
      # reference = PrefixTreeHandler.prefixtree_entries reference_mss, 230
      # target = PrefixTreeHandler.prefixtree_entries mss_list.first, 230
    end


    def find_entries_with_local_routing
      prefix_tree_entries[reference_mss].collect {|e| e unless e.digitfence.routeaction.to_s =~ /^911/}.compact
    end

    def local_route_cases entries
      entries.collect {|e| e.digitfence.routeaction}.uniq
    end
  end
end
 
 
if __FILE__ == $0 
  # Alcatel::E911Auditor.new(ARGV.shift, ARGV).run
  require_relative './prefixtree230'
  prefix_tree_data = {}
  ARGV.each do |mss|
    entries = Alcatel::PrefixTree230.new(mss).entries
    prefix_tree_data.store(mss, entries)
  end
  # puts prefix_tree_data.class
  # puts prefix_tree_data.keys
  Alcatel::E911Auditor.new(ARGV.shift, ARGV, prefix_tree_data).run
end
 
 

#!/usr/bin/env ruby -w

require_relative '../lib/e911_auditor'
require_relative '../lib/prefixtree230'


module Alcatel

  class E911AuditRunner

    attr_accessor :mss_list

    def initialize mss_list
      @mss_list = mss_list
      @prefix_tree_entries = load_prefix_tree_entries
    end

    def run
      mss_list.size.times do
        mss_name = mss_list.shift
        E911Auditor.new(mss_name, mss_list, @prefix_tree_entries).run
        mss_list << mss_name
      end
    end

    def load_prefix_tree_entries
      prefix_tree_data = {}
      mss_list.each do |mss|
        entries = PrefixTree230.new(mss).entries
        prefix_tree_data.store(mss, entries)
      end
      prefix_tree_data
    end
  end
end
 
 
if __FILE__ == $0 
  Alcatel::E911AuditRunner.new(ARGV).run
end
 
 

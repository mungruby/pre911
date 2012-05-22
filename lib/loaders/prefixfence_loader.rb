#!/usr/bin/env ruby -w

require_relative '../small_edw'


module Alcatel

  class PrefixFenceLoader

    attr_accessor :mss_name, :prefix_tree

    def initialize mss_name, prefix_tree = nil
      @mss_name = mss_name.upcase
      @prefix_tree = prefix_tree
    end

    # MSSID
    # MSSName
    # LastUpdated
    # PREFIXTREESELECTOR
    # DIGITPATTERN
    # TRANSLATIONGROUP
    # EXPECTEDDIGITCOUNT
    # DIGITFENCEINDEX
    # DESCRIPTION
    # SELECTOR_TYPE
    def load_entries_from_edw
      STDERR.puts "Loading PrefixFence data from EDW for #{mss_name}."
      data = []
      SqlServer.create(EDW::SOURCE, EDW::DM_ALCATEL::DATABASE) do |db|
        db.query sql
        # puts db.fields
        data = db.data
      end
      data
    end

    def sql
      sql = "SELECT * FROM dbo.emsdata_EMSPREFIXFENCE WHERE MSSName = '#{mss_name}'"
      if prefix_tree
        sql << "AND PREFIXTREESELECTOR = #{prefix_tree} ORDER BY DIGITPATTERN"
      else
        sql << "ORDER BY PREFIXTREESELECTOR, DIGITPATTERN"
      end
    end

  end
end
 
 
if __FILE__ == $0 
  loader = Alcatel::PrefixFenceLoader.new ARGV[0], ARGV[1]
  entries = loader.load_entries_from_edw
  puts entries.size
  p entries.first
end
 
 

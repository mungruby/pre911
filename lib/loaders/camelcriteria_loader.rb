#!/usr/bin/env ruby -w

require_relative '../small_edw'


module Alcatel

  class CamelCriteriaLoader

    attr_accessor :mss_name

    def initialize mss_name
      @mss_name = mss_name.upcase
    end

    # MSSID
    # MSSName
    # LastUpdated
    # DIGITFENCEINDEX
    # DEFAULTHANDLING
    # SERVICEKEY
    # PROTOCOLTYPE
    # DIGITSTYPE
    # NETWORKLISTSINDEX
    # NODEID
    # SCFBUNDLEID
    # GSMSCFADDR
    # VERSION
    # SSN
    def load_entries_from_edw
      STDERR.puts "Loading Camel Criteria Data from EDW for #{mss_name}."
      data = []
      SqlServer.create(EDW::SOURCE, EDW::DM_ALCATEL::DATABASE) do |db|
        db.query sql
        # puts db.fields
        data = db.data
      end
      data
    end

    def sql
      <<-SQL
        SELECT *
        FROM dbo.callprocessing_CAMEL_N_CSI_DP_CRITERIA_DATA
        WHERE MSSName = '#{mss_name}'
      SQL
    end

  end
end
 
 
if __FILE__ == $0 
  loader = Alcatel::CamelCriteriaLoader.new ARGV[0]
  entries = loader.load_entries_from_edw
  puts entries.size
  p entries.first
end
 
 

#!/usr/bin/env ruby -w

require_relative '../small_edw'


module Alcatel

  class DigitFenceLoader

    attr_accessor :mss_name

    def initialize mss_name
      @mss_name = mss_name.upcase
    end

    # MSSID
    # MSSName
    # LastUpdated
    # DIGITFENCEINDEX
    # TRANSLATIONGROUP
    # ONEPLUSOPTION
    # LEADINGDIGITSCUT
    # LEADINGDIGITSADD
    # EXPECTEDDIGITCOUNT
    # TERMINATIONTYPE
    # SERVICEINDEX
    # DIGITTYPE
    # ROUTEACTIONTYPE
    # ROUTEACTION
    # OUTPULSE_01R_IND
    # OUTPULSE_0ZZ_IND
    # CARRIERID
    # MAXDIGITCOUNT
    # LEADINGDIGITSADDTYPE
    # ECHOCANCELLATION
    # COUNTRYCODE
    # OUTPUTNOA
    # TARIFFGROUP
    # DESTINATIONTYPE
    # CPC
    # INTLPREFIXLEN
    # NATTREESELECTOR
    # STARTPOSITION
    # SOURCENUMBER1
    # MODIFYDIGITINDEX1
    # SOURCENUMBER2
    # MODIFYDIGITINDEX2
    # SOURCENUMBER3
    # MODIFYDIGITINDEX3
    # SOURCENUMBER4
    # MODIFYDIGITINDEX4
    # SOURCENUMBER5
    # MODIFYDIGITINDEX5
    # TONEANNID
    # TONEDURATION
    # CALLGAPPFILTERID
    # NOCHARGE
    def load_entries_from_edw
      STDERR.puts "Loading DigitFence data from EDW for #{mss_name}."
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
        FROM dbo.callprocessing_CPCALLMDIGITFENCE
        WHERE MSSName = '#{mss_name}'
      SQL
    end

  end
end
 
 
if __FILE__ == $0 
  loader = Alcatel::DigitFenceLoader.new ARGV[0]
  entries = loader.load_entries_from_edw
  puts entries.size
  p entries.first
end
 
 

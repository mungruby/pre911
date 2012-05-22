#!/usr/bin/env ruby -w

module Alcatel
 
  module DigitFenceFactory

    def self.create digitfence_data
      STDERR.puts "Creating Digit Fence Data objects"
      dto = data_transfer_object
      digitfence_data.map { |df| dto.new( *df.drop(3) ) }
    end
   
    # def self.create digitfence_data
    #   data_transfer_object.new(*digitfence_data.drop(3))
    # end
   
    def self.data_transfer_object
      @dto ||= Struct.new('DigitFence', *fields)
    end

    def self.fields
      @fields ||=
        %w[ DIGITFENCEINDEX
            TRANSLATIONGROUP
            ONEPLUSOPTION
            LEADINGDIGITSCUT
            LEADINGDIGITSADD
            EXPECTEDDIGITCOUNT
            TERMINATIONTYPE
            SERVICEINDEX
            DIGITTYPE
            ROUTEACTIONTYPE
            ROUTEACTION
            OUTPULSE_01R_IND
            OUTPULSE_0ZZ_IND
            CARRIERID
            MAXDIGITCOUNT
            LEADINGDIGITSADDTYPE
            ECHOCANCELLATION
            COUNTRYCODE
            OUTPUTNOA
            TARIFFGROUP
            DESTINATIONTYPE
            CPC
            INTLPREFIXLEN
            NATTREESELECTOR
            STARTPOSITION
            SOURCENUMBER1
            MODIFYDIGITINDEX1
            SOURCENUMBER2
            MODIFYDIGITINDEX2
            SOURCENUMBER3
            MODIFYDIGITINDEX3
            SOURCENUMBER4
            MODIFYDIGITINDEX4
            SOURCENUMBER5
            MODIFYDIGITINDEX5
            TONEANNID
            TONEDURATION
            CALLGAPPFILTERID
            NOCHARGE
          ].map {|f| f.downcase.to_sym}
    end

  end
end
 
 
if __FILE__ == $0 
  puts Alcatel::DigitFenceFactory.fields
  p Alcatel::DigitFenceFactory.data_transfer_object
  data = [["{90E30F50-F6AA-41AB-AE1C-F63E0C032FAD}", "VGMSS861", "2012-05-19 03:45:57 -0700",
          4202, 1, 0, 0, nil, 10, 1, 1, 17, 8, 911692, 0, 0, "0000", 10, 0, 0, nil, 255,
          1, 1, 255, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "0", "0", "0", "0"]]
  p Alcatel::DigitFenceFactory.create data
end
 
 

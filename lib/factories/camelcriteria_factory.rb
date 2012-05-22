#!/usr/bin/env ruby -w

module Alcatel
 
  module CamelCriteriaFactory

    def self.create camelcriteria_data
      STDERR.puts "Creating Camel Criteria Data objects"
      dto = data_transfer_object
      camelcriteria_data.map { |ccd| dto.new( *ccd.drop(3) ) }
    end
   
    # def self.create camel_criteria_data
    #   data_transfer_object.new(*camel_criteria_data.drop(3))
    # end
   
    def self.data_transfer_object
      @dto ||= Struct.new('CamelCriteria', *fields)
    end

    def self.fields
      @fields ||=
        %w[ DIGITFENCEINDEX
            DEFAULTHANDLING
            SERVICEKEY
            PROTOCOLTYPE
            DIGITSTYPE
            NETWORKLISTSINDEX
            NODEID
            SCFBUNDLEID
            GSMSCFADDR
            VERSION
            SSN
          ].map {|f| f.downcase.to_sym}
    end

  end
end
 
 
if __FILE__ == $0 
  puts Alcatel::CamelCriteriaFactory.fields
  p Alcatel::CamelCriteriaFactory.data_transfer_object
  data = [["{90E30F50-F6AA-41AB-AE1C-F63E0C032FAD}", "VGMSS861", "2012-05-19 03:45:57 -0700",
          1470, 1, 78, 2, 1, 0, 4, 0, nil, nil, 12]]
  p Alcatel::CamelCriteriaFactory.create data
end
 
 

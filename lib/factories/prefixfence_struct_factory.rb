#!/usr/bin/env ruby -w

module Alcatel
 
  module PrefixFenceFactory

    def self.create prefixfence_data
      dto = data_transfer_object
      prefixfence_data.map { |pf| dto.new *pf.drop(3) }
    end
   
    # def self.create prefixfence_data
    #   data_transfer_object.new(*prefixfence_data.drop(3))
    # end
   
    def self.data_transfer_object
      @dto ||= Struct.new('PrefixFence', *fields)
    end

    def self.fields
      @fields ||=
        %w[ PREFIXTREESELECTOR
            DIGITPATTERN
            TRANSLATIONGROUP
            EXPECTEDDIGITCOUNT
            DIGITFENCEINDEX
            DESCRIPTION
            SELECTOR_TYPE
      ].map {|f| f.downcase.to_sym}
    end

  end
end
 
 
if __FILE__ == $0 
  puts Alcatel::PrefixFenceFactory.fields
  p Alcatel::PrefixFenceFactory.data_transfer_object
  data = [["{90E30F50-F6AA-41AB-AE1C-F63E0C032FAD}", "VGMSS861", "2012-05-19 03:46:26 -0700",
           230, "1                               ", 1, 11,
          3198, "1-NPA-NXX-XXXX                  ", 0]]
  p Alcatel::PrefixFenceFactory.create data
end
 
 

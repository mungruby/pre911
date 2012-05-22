#!/usr/bin/env ruby -w

require_relative 'prefixfence'


module Alcatel
 
  module PrefixFenceFactory

    def self.create prefixfence_data
      STDERR.puts "Creating Prefix Fence Data objects"
      dto = Prefixfence
      prefixfence_data.map { |pf| dto.new pf.drop(3) }
    end
   
  end
end
 
 
if __FILE__ == $0 
  data = [["{90E30F50-F6AA-41AB-AE1C-F63E0C032FAD}", "VGMSS861", "2012-05-19 03:46:26 -0700",
           230, "1                               ", 1, 11,
          3198, "1-NPA-NXX-XXXX                  ", 0]]
  pf = Alcatel::PrefixFenceFactory.create data
  p pf
  puts pf.first.to_key
end
 
 

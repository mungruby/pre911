
 
module Alcatel
 
  module DigitFenceMapper

    #
    # joins digitfence data to prefixfence data based upon the digitfenceindex and expecteddigitcount
    #
    def self.join prefixfence, digitfence
      STDERR.puts "Joining Prefix Fence Data"
      digit_fence = digitfence.group_by {|df| df.digitfenceindex.to_i}
      prefixfence.each do |prefix_fence|
        data = digit_fence[prefix_fence.digitfenceindex.to_i]
        prefix_fence.digitfence = find_by_expecteddigitcount data, prefix_fence.expecteddigitcount
        prefix_fence.digitfence.digitfenceindex = nil
      end
      prefixfence
    end

    def self.find_by_expecteddigitcount data, count
      if data.size == 1
        data.first
      else
        data.find {|digit_fence| digit_fence.expecteddigitcount.to_i == count}
      end
    end

  end
end
 
 

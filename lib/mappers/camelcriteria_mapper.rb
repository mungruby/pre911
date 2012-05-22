
 
module Alcatel
 
  module CamelCriteriaMapper

    #
    # joins camel criteria data to prefixfence data based upon the digitfenceindex
    #
    def self.join prefixfence, camelcriteria
      STDERR.puts "Joining Camel Criteria Data"
      camel_criteria = camelcriteria.group_by {|ccd| ccd.digitfenceindex.to_i}
      prefixfence.each do |prefix_fence|
        if data = camel_criteria[prefix_fence.digitfenceindex.to_i]
          prefix_fence.camelcriteria = data.first
          prefix_fence.camelcriteria.digitfenceindex = nil
        end
      end
      prefixfence
    end

  end
end
 
 

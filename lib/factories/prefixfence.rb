

module Alcatel

  class Prefixfence

    attr_reader :prefixtreeselector, :digitpattern, :translationgroup, :expecteddigitcount
    attr_accessor :digitfenceindex, :digitfence, :camelcriteria
    attr_reader :description, :selector_type
 
    def initialize fields
      @prefixtreeselector = fields[0].to_i
      @digitpattern       = fields[1].rstrip
      @translationgroup   = fields[2].to_i
      @expecteddigitcount = fields[3].to_i
      @digitfenceindex    = fields[4].to_i
      @description        = fields[5].rstrip
      @selector_type      = fields[6].to_i
      @digitfence         = nil
      @camelcriteria     = nil
    end
   
    def to_key
      "#{@prefixtreeselector}-#{@digitpattern}-#{@translationgroup}-#{@expecteddigitcount}"
    end
  end
end


if __FILE__ == $0 
  data = ["{90E30F50-F6AA-41AB-AE1C-F63E0C032FAD}", "VGMSS861", "2012-05-19 03:46:26 -0700",
           230, "1                               ", 1, 11,
          3198, "1-NPA-NXX-XXXX                  ", 0].drop(3)
  pf = Alcatel::Prefixfence.new data
  p pf
  puts pf.to_key
end
 


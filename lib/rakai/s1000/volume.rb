require 'rakai/s1000/index_entry'

module Rakai
  module S1000
    class Volume < BinData::Record
  
      # headers
      array :indices, type: :index_entry, read_until: lambda { index == 63 }
    end
  end
end

require 'rakai/s900/index_entry'
require 'rakai/s900/sample'

module Rakai
  module S900
    class Volume < BinData::Record
  
      # headers
      array :indices, type: :index_entry, read_until: lambda { index == 63 }
    end
  end
end

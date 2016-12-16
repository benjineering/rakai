require 'rakai/base/volume'
require 'rakai/s900/index_entry'

module Rakai
  module S900
    class Volume < Rakai::Base::Volume
  
      # headers
      array :indices, type: :index_entry, read_until: lambda { index == 63 }
    end
  end
end

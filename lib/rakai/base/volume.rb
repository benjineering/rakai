require 'bindata'

module Rakai
  module Base
    class Volume < BinData::Record
      endian :little
    end
  end
end

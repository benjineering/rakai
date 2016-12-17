require 'bindata'

module Rakai
  module Base
    
    class Base < BinData::Record
      BLOCK_SIZE = 1024

      endian :little
    end
  end
end

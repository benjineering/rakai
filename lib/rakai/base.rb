require 'bindata'

module Rakai    
  class Base < BinData::Record
    BLOCK_SIZE = 1024 * 8
    endian :little

    def method_missing(m, *args, &block)  
      buffer.send(m, *args, &block)
    end
  end
end

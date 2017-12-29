require 'bindata'

BinDataRecord = BinData::Record

module Rakai
  module BinData
    class Base < BinDataRecord
      BLOCK_SIZE = 1024 * 8
      endian :little

      def method_missing(m, *args, &block)
        if buffer.respond_to?(m)
          buffer.send(m, *args, &block)
        else
          raise NotImplementedError.new
        end
      end
    end
  end
end

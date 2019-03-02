require 'bindata'

BinDataRecord = BinData::Record

module Rakai
  module BinData
    class Base < BinDataRecord
      BLOCK_SIZE = 1024 * 8
      endian :little
    end
  end
end

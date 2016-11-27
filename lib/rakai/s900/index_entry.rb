require 'bindata'

module Rakai
  module S900
    class IndexEntry < BinData::Record

      # regular ol' ascii
      string :file_name, length: 10

      # six bytes of 0
      uint8 :six_zeros

      # File type: 'S'=sample, 'P'=program, etc.
      string :file_type, length: 1

      # file length in bytes
      uint24 :length

      # starting block on disk
      uint16 :start_block

      # S900 ID = [ 0, 0 ]
      uint16 :s900_id

      def to_s
        puts "'#{@file_name}', type: '#{@file_type}', length: '#{@length}', start: '#{@start_block}'"
      end
    end
  end
end

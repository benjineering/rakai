require 'bindata'

module Rakai
  module Base
    class IndexEntry < BinData::Record
      endian :little
      
      def valid?
        file_length > 0
      end

      def to_s
        puts "'#{file_name}', type: '#{file_type}', length: '#{file_length}', start: '#{start_block}'"
      end
    end
  end
end

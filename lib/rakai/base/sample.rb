require 'bindata'

module Rakai
  module Base
    class Sample < BinData::Record
      endian :little

      def to_s
        puts "#{file_name} length: #{sample_word_count}, rate: #{sample_rate}Hz"
      end
    end
  end
end

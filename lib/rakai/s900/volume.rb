require 'rakai/s900/index_entry'

=begin rdoc
TODO:

disk
  -partition (A:, B: etc.)
    - volume (VOLUME 001, VOLUME 002 etc)
      - index
      - files (samples, programs etc.)
=end

module Rakai
  module S900
    class Volume < BinData::Record
  
      # headers
      array :index, type: :index_entry, read_until: lambda { index == 63 }
      
      def to_s
        @index.each { |entry| puts entry }
      end
    end
  end
end

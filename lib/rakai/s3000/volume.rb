require 'rakai/base/volume'
require 'rakai/s3000/index_entry'

module Rakai
  module S3000    
=begin rdoc

The S3000 disk has space for file entries and map the same as for the S1000,
but has a value of 255 at byte 17 signifying that these file entries will be 
ignored, and 512 entries starting at block 5 will be used instead. 

The first 17 map entries are marked with the value 16384.

=end
    class Volume < Rakai::Base::Volume
      #hide :map_and_padding, :three_zeros

      #skip length: BLOCK_SIZE * 4

      array :file_index, initial_length: 512 do
        index_entry
      end

      array :map_and_padding, initial_length: 3_200 do
        uint8
      end

      akai_string :name, length: 12

      array :three_zeros, type: :uint8, initial_length: 3

      uint8 :format_id

      bit80 :ten_numbers

      def to_s
        entries = file_index.collect do |e| 
          e.valid? ? "  #{e.to_s}\n" : ''
        end.join

        "#{entries}"
      end
    end
  end
end

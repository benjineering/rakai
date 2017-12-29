require 'rakai/bin_data/base'
require 'rakai/bin_data/s1000/index_entry'

module Rakai
  module BinData
    module S1000
=begin

The map now uses a value of 19152 as an end marker, and the first five blocks 
(file entries and map) are marked with values of 16384.

There is a volume label at the end of the map (byte 3136 or 4736 depending 
on density) consisting of a 12 byte AKAII name followed by 
0,0,0,ID,0,1,1,0,0,0,50,9,12,255 where ID = 3 for the S1000.

Note that the S01 uses the S1000 format for disks and samples, but with an ID of 
1,0 for high density and 0,1 for low-density unused entries. The S1100 probably 
uses the same format with a different ID.

=end
      class Volume < Rakai::BinData::Base
    
        array :file_index, type: :index_entry, initial_length: 64

        array :map_and_padding, type: :uint8, initial_length: map_and_padding_bytes

        akai_string :name, length: 12

        array :three_zeros, type: :uint8, initial_length: 3

        uint8 :format_id

        bit80 :ten_numbers
      end
    end
  end
end

require 'bindata'

module Rakai
  module S1000
    
    # Each S1000 volume begins with 64 index entries
    class IndexEntry < BinData::Record

      # 12 char AKAI string file name
      akai_string :file_name, length: 12

      # S1000 = [32,32,32,32]
      # S3000 = [0,0,0,2] (1 for low density?)
      array :four_ints, initial_length: 4 do
        bit8
      end

      # ASCII 's'=sample, 'p'=program, etc.
      bit8le :file_type

      # file length in bytes. Value is 3 bytes long
      bit24le :file_length

      # starting block on disk
      bit16le :starting_block

      # S1000 = [0,3]
      # S3000 = [0,12] or [0,11] for low density
      array :version_id, initial_length: 2 do
        bit8le
      end
    end
  end
end

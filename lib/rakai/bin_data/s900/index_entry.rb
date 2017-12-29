require 'rakai/bin_data/base'

module Rakai
  module BinData
    module S900    
=begin rdoc

S900/S950 disk format

Track 1, side 1 starts with 64 entries of 24 bytes as follows:

   Length   Format      Description
   -----------------------------------------------------------
     10     ASCII       Filename
      6                 0
      1     ASCII       File type: 'S'=sample, 'P'=program, etc.
      3     unsigned    File length in bytes
      2     unsigned    Starting block on disk
      2                 S900 ID = {0,0}

Bytes 1536 to 3136 (1536 to 4736 for high density) contain a map of how the 
blocks on the disk are used, in the form of 2-byte unsigned integers. For 
example, if a file starts at block 5, map entry 5 may contain the value 6, 
indicating that the next block to read is block 6. The next block to read is 
then given by map entry 6. The map entry for the last block of a file contains 
the value 32768. Unused blocks have a map entry of zero. The first 4 blocks are 
needed for the file entries and map.

Note that the S950 can use high-density disks and can read S1000 disks, but the 
S900 can only read S900 or S950 low-density disks.

=end
      class IndexEntry < Rakai::BinData::Base
        string :file_name, length: 10

        bit48 :six_zeros

        string :file_type, length: 1

        bit24 :file_length

        uint16 :start_block

        uint16 :s900_id
      end
    end
  end
end

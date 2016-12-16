require 'rakai/base/index_entry'

module Rakai
  module S1000

=begin rdoc

With the S1000, Akai abandon ASCII (mostly) and use their own alphanumeric code, 
which I shall refer to as AKAII:

    Character    ASCII       AKAII
   ----------------------------------
     0 - 9       48 - 57     0 - 9              
     space       32          10
     A - Z       65 - 90     11 - 36
     #           35          37
     +           43          38
     -           45          39
     .           46          40

The file entries and map are in the same position as the S900, but have changed 
slightly:

   Length   Format      Description
   ----------------------------------------------------------------
     12     AKAII       Filename
      4                 32,32,32,32
      1     ASCII       File type: 's'=sample, 'p'=program, etc.
      3     unsigned    File length in bytes
      2     unsigned    Starting block on disk
      2                 S1000 ID = 0,3

Empty entries also have the S1000 ID byte. Note that file types are lower-case 
ASCII. The map now uses a value of 19152 as an end marker, and the first five 
blocks (file entries and map) are marked with values of 16384.

There is a volume label at the end of the map (byte 3136 or 4736 depending on 
density) consisting of a 12 byte AKAII name followed by 
0,0,0,ID,0,1,1,0,0,0,50,9,12,255 where ID = 3 for the S1000.

Note that the S01 uses the S1000 format for disks and samples, but with an ID of 
1,0 for high density and 0,1 for low-density unused entries. The S1100 probably 
uses the same format with a different ID.

=end
    class IndexEntry < BinData::Record

      akai_string :file_name, length: 12

      array :four_ints, initial_length: 4 do
        bit8
      end

      bit8 :file_type

      bit24 :file_length

      bit16 :starting_block

      array :version_id, initial_length: 2 do
        bit8
      end
    end
  end
end

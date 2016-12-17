require 'rakai/s1000/index_entry'

module Rakai
  module S3000
=begin

The S3000 disk has space for file entries and map the same as for the S1000, but 
has a value of 255 at byte 17 signifying that these file entries will be ignored,
and 512 entries starting at block 5 will be used instead. The first 17 map 
entries are marked with the value 16384.

Length   Format              Description
--------------------------------------------------------------------
 12     AKAII        Filename
  4                  0,0,0,2 (1 for low density?)
  1     ASCII + 128  File type: 211=sample, 208=program, etc.
  3     unsigned     File length in bytes
  2     unsigned     Starting block on disk
  2                  S3000 ID = 0,12 or 0,11 for low density

The disk label is the same as the S1000 except for the S3000 ID byte. Subtracting
128 from the S3000 file type gives a set of ASCII characters shared with the 
earlier samplers:

   A,O   All Settings
   B     SysEx Data 
   C,Y   Operating System 
   D     Drum Triggers 
   P     Program 
   Q     Cue List 
   T     Take List 
   X     Effects Settings

Stereo samples are stored as two separate mono files with the 11th and 12th 
characters of the filename set to -L or -R. The S01 and S20 use preset filenames 
of the form AKAI A1#.%1 where # is a hexadecimal character representing the 
sample number and % is S for mono and left-channel samples or R for right-channel
samples.

=end
    class IndexEntry < Rakai::S1000::IndexEntry
    end
  end
end

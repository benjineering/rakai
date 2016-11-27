require 'bindata'

module Rakai
  module S900
=begin rdoc

S900/S950 sample format

A S900 sample file has a header of 60 bytes as follows:

   Length   Format      Description
   ------------------------------------------------------------
     10     ASCII       Filename
      6                 0
      4     unsigned    Number of sample words
      2     unsigned    Sample rate (Hz)
      2     unsigned    Tuning (16ths of a semitone, C3=960)
      2                 0 
      1     ASCII       Loop mode (O=one-shot, L=loop, A=alt)
      1                 0
      4     unsigned    End marker
      4     unsigned    Start marker
      4     unsigned    Loop length
     20                 140,185,0,78,0,0,0,0,0,0,0,0,0,0,224,43,38,0,0,0

(I don't know what is held in the last 20 bytes, but the values shown seem to 
work).

You can use lower case letters in filenames (not available from the front panel) 
but avoid unusual ASCII characters. Do not put two files with the same name on a 
disk!

The header is followed by the (12-bit signed) sample data, packed in a very 
strange way: For a sample of N words, the upper 4 bits of the first byte contains
the lower 4 bits of the first word. The lower 4 bits of the first byte contain 
the lower 4 bits of word N/2. The second byte contains the upper 8 bits of the 
first word. This repeats for the first N bytes, after which there are N/2 bytes 
containing the upper 8 bits of the last N/2 words.

=end
    class Sample < BinData::Record
      endian :little

      string :file_name, length: 10

      bit48 :six_zeros

      uint32 :sample_length

      uint16 :sample_rate

      uint16 :tuning

      uint16 :two_zeros

      string :loop_mode, length: 1

      uint8 :one_zero

      uint32 :loop_end

      uint32 :loop_start

      uint32 :loop_length

      bit160 :gibberish

      def to_s
        puts "#{file_name} length: #{sample_length}, rate: #{sample_rate}Hz"
      end
    end
  end
end

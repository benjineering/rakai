require 'rakai/bin_data/base'
require 'rakai/bin_data/s1000/akai_string'

module Rakai
  module BinData
    module S3000
=begin

The S3000 sample has a 192 byte header:
   Length   Format              Description
   ----------------------------------------------------------------------
      1                         3
      1                         Not important: 0 for 22050Hz, 1 for 44100Hz
      1     unsigned char       MIDI root note (C3=60)
     12     AKAII (see above)   Filename
  
      1                         128
      1     unsigned char       Number of active loops
      1     unsigned char       First active loop (0 for none)
      1                         0
      1                         Loop mode: 0=in release 1=until release
                                           2=none       3=play to end
      1     signed char         Cents tune -50...+50
      1     signed char         Semi tune  -50...+50
      4                         0,8,2,0

      4     unsigned long int   Number of sample words
      4     unsigned long int   Start marker (first word is 0)
      4     unsigned long int   End marker 
   
      4     unsigned long int   Loop 1 marker
      2     unsigned int        Loop 1 fine length   (65536ths)
      4     unsigned long int   Loop 1 coarse length (words) 
      2     unsigned int        Loop 1 time          (milliseconds) 
       
     84     [as above]          Loops 2 to 8 
                                (Loop 5 marker may be 234,255,151,122)

      4                         0,0,255,255 
      2     unsigned int        Sampling frequency
      1     signed char         Loop tune offset -50...+50
     39                         0,0,0... 

Sometimes the sampler will insert more blank space at the end of the header! 
Make sure your samples are at least a few thousand words long or they will not 
play correctly. The sample data follows the header as signed 16-bit words. For 
details of the S3000 program format see the SysEx information on Akai's web site.

=end

      class SampleLoop < Rakai::BinData::Base
        uint32 :marker
        uint16 :fine_length
        uint32 :coarse_length
        uint16 :time
      end


      class Sample < Rakai::BinData::Base
        uint8 :three
        uint8 :frequency_switch
        uint8 :root_note
        akai_string :file_name, length: 12
        uint8 :one_two_eight
        uint8 :active_loops
        uint8 :first_active_loop
        uint8 :zero
        uint8 :loop_mode
        uint8 :cents_tune
        uint8 :semi_tune
        uint32 :zero_eight_two_zero
        uint32 :sample_words
        uint32 :start_marker
        uint32 :end_marker
        array :loops, initial_length: 8, type: :sample_loop
        uint32 :stuff
        uint16 :frequency
        int8 :tune_offset
        array :other_stuff, initial_length: 39, type: :uint8
        array :sample_data, initial_length: :sample_words, type: :uint16
      end
    end
  end
end

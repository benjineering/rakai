require 'rakai/base/sample'
require 'rakai/s1000/akai_string'
require 'rakai/s1000/loop_marker'

module Rakai
  module S1000
=begin

The S1000 sample file has a 150 byte header:
   Length   Format      Description
   --------------------------------------------------------------
      1                 3
      1                 Not important: 0 for 22050Hz, 1 for 44100Hz 
      1     unsigned    MIDI root note (C3=60)
     12     AKAII       Filename
      1                 128
      1     unsigned    Number of active loops
      2                 0,0
      1     unsigned    Loop mode: 0=in release 1=until release
                                   2=none       3=play to end
      1     signed      Cents tune -50...+50
      1     signed      Semi tune  -50...+50
      4                 0,8,2,0

      4     unsigned    Number of sample words
      4     unsigned    Start marker
      4     unsigned    End marker
   
      4     unsigned    Loop 1 marker
      2     unsigned    Loop 1 fine length   (65536ths)
      4     unsigned    Loop 1 coarse length (words) 
      2     unsigned    Loop 1 time          (msec. or 9999=infinite) 
       
     84     [as above]  Loops 2 to 8 
  
      4                 0,0,255,255
      2     unsigned    Sampling frequency
     10                 0,0,0...
The sample data follows the header as signed 16-bit words.

=end
    class Sample < Rakai::Base::Sample
      uint8 :a_three

      uint8 :sample_rate_enum

      uint8 :midi_root_note

      akai_string :file_name, length: 12

      uint8 :one_hundred_and_twenty_eight

      uint8 :number_of_active_loops

      uint8 :two_zeros

      uint8 :loop_mode_enum

      int8 :cents_tune

      int8 :semi_tune

      uint8 :zero_eight_two_zero

      uint32 :sample_word_count

      uint32 :start_marker

      uint32 :end_marker

      array :loop, type: :loop_marker, length: 8

      uint32 :two_zeros_and_two_255s

      uint16 :sample_rate

      bit80 :ten_zeros

      array :data, read_until: lambda { index == sample_word_count - 1 } do
        int16
      end
      
      def pcm
        data.to_a
      end
    end
  end
end

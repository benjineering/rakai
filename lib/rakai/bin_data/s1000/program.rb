require 'rakai/bin_data/base'

module Rakai
  module BinData
    module S1000
    
=begin

The S1000 program file consists of a 150-byte header followed by one or more 
150-byte keygroup entries.

Most parameters are stored as signed or unsigned single bytes.

byte     description                 default     range/comments
---------------------------------------------------------------------------
 1       program ID                  1
 2-3     first keygroup address      150,0       
 4-15    program name                10,10,10... AKAII character set
 16      MIDI program number         0           0..127
 17      MIDI channel                0           0..15, 255=OMNI
 18      polyphony                   15          1..16
 19      priority                    1           0=LOW 1=NORM 2=HIGH 3=HOLD
 20      low key                     24          24..127
 21      high key                    127         24..127
 22      octave shift                0           -2..2
 23      aux output select           255         0..7, 255=OFF
 24      mix output level            99          0..99
 25      mix output pan              0           -50..50
 26      volume                      80          0..99
 27      vel>volume                  20          -50..50
 28      key>volume                  0           -50..50
 29      pres>volume                 0           -50..50
 30      pan lfo rate                50          0..99
 31      pan lfo depth               0           0..99
 32      pan lfo delay               0           0..99
 33      key>pan                     0           -50..50
 34      lfo rate                    50          0..99
 35      lfo depth                   0           0..99
 36      lfo delay                   0           0..99
 37      mod>lfo depth               30          0..99
 38      pres>lfo depth              0           0..99
 39      vel>lfo depth               0           0..99
 40      bend>pitch                  2           0..12 semitones
 41      pres>pitch                  0           -12..12 semitones
 42      keygroup crossfade          0           0=OFF 1=ON
 43      number of keygroups         1           1..99
 44      (internal use)              0           program number
 45-56   key temperament C,C#,D...   0           -25..25 cents
 57      fx output                   0           0=OFF 1=ON
 58      mod>pan                     0           -50..50
 59      stereo coherence            0           0=OFF 1=ON
 60      lfo desync                  1           0=OFF 1=ON
 61      pitch law                   0           0=LINEAR
 62      voice re-assign             0           0=OLDEST 1=QUIETEST
 63      softped>volume              10          0..99
 64      softped>attack              10          0..99
 65      softped>filt                10          0..99
 66      tune cents                  0           -128..127 (-50..50 cents)
 67      tune semitones              0           -50..50
 68      key>lfo rate                0           -50..50
 69      key>lfo depth               0           -50..50
 70      key>lfo delay               0           -50..50
 71      voice output scale          1           0=-6dB 1=0dB 2=+12dB
 72      stereo output scale         0           0=0dB 1=+6dB
 73-150  (not used)


byte     description                 default     range/comments
---------------------------------------------------------------------------
 1       keygroup ID                 2
 2-3     next keygroup address       44,1        300,450,600,750.. (16-bit)         
 4       low key                     24          24..127
 5       high key                    127         24..127
 6       tune cents                  0           -128..127 (-50..50 cents)
 7       tune semitones              0           -50..50
 8       filter                      99          0..99
 9       key>filter                  12          0..24 semitone/oct
 10      vel>filt                    0           -50..50
 11      pres>filt                   0           -50..50
 12      env2>filt                   0           -50..50
 13      env1 attack                 0           0..99
 14      env1 decay                  30          0..99
 15      env1 sustain                99          0..99
 16      env1 release                45          0..99
 17      env1 vel>attack             0           -50..50
 18      env1 vel>release            0           -50..50 
 19      env1 offvel>release         0           -50..50
 20      env1 key>dec&rel            0           -50..50
 21      env2 attack                 0           0..99
 22      env2 decay                  50          0..99
 23      env2 sustain                99          0..99
 24      env2 release                45          0..99
 25      env2 vel>attack             0           -50..50
 26      env2 vel>release            0           -50..50
 27      env2 offvel>release         0           -50..50
 28      env2 key>dec&rel            0           -50..50
 29      vel>env2>filter             0           -50..50
 30      env2>pitch                  0           -50..50
 31      vel zone crossfade          1           0=OFF 1=ON
 32      vel zones used              4           
 33      (internal use)              255         
 34      (internal use)              255         

 35-46   sample 1 name               10,10,10... AKAII character set
 47      low vel                     0           0..127
 48      high vel                    127         0..127
 49      tune cents                  0           -128..127 (-50..50 cents)
 50      tune semitones              0           -50..50
 51      loudness                    0           -50..+50
 52      filter                      0           -50..+50
 53      pan                         0           -50..+50
 54      loop mode                   0           0=AS_SAMPLE 1=LOOP_IN_REL 
                                                 2=LOOP_UNTIL_REL 3=NO_LOOP 
                                                 4=PLAY_TO_END
 55      (internal use)              255
 56      (internal use)              255
 57-58   (internal use)              44,1

 59-82   [repeat 35-58 for sample 2]

 83-106  [repeat 35-58 for sample 3]

 107-130 [repeat 35-58 for sample 4]

 131     beat detune                 0           -50..50
 132     hold attack until loop      0           0=OFF 1=ON
 133-136 sample 1-4 key tracking     0           0=TRACK 1=FIXED
 137-140 sample 1-4 aux out offset   0           0..7
 141-148 vel>sample start            0           -9999..9999 (16-bit signed)
 149     vel>volume offset           0           -50..50
 150     (not used)

=end
      class Program < Rakai::BinData::Base
        # TODO
      end
    end
  end
end

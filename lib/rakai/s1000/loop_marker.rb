require 'rakai/base'

module Rakai
  module S1000
=begin

Length   Format      Description
--------------------------------------------------------------
  4     unsigned    Loop 1 marker
  2     unsigned    Loop 1 fine length   (65536ths)
  4     unsigned    Loop 1 coarse length (words) 
  2     unsigned    Loop 1 time          (msec. or 9999=infinite) 

=end
    class LoopMarker < Rakai::Base
      uint32 :start

      uint16 :fine_length

      uint32 :coarse_length

      uint16 :time
    end
  end
end

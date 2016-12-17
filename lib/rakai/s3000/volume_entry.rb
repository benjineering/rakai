require 'rakai/base/volume_entry'
require 'rakai/s1000/akai_string'

module Rakai
  module S3000
=begin rdoc
  
Unable to find any info about disks with multiple volumes, so this is from my own
experimantation using an S2000 with an internal SCSI SD card drive.

=end
    class VolumeEntry < Rakai::Base::VolumeEntry
      akai_string :name, length: 12

      uint32 :unsure

      def to_s
        puts "#{name.to_ascii} #{unsure}"
      end
    end
  end
end

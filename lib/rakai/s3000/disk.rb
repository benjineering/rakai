require 'rakai/base/disk'
require 'rakai/s3000/volume'
require 'rakai/s3000/volume_entry'

module Rakai
  module S3000    
=begin rdoc
  
Unable to find any info about disks with multiple volumes, so this is from my own
experimantation using an S2000 with an internal SCSI SD card drive.

=end
    class Disk < Rakai::Base::Disk
      array :unknown, initial_length: 202 do
        int8
      end

      array :volume_index, initial_length: 100 do
        volume_entry
      end
    end
  end
end

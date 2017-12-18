require 'rakai/base/disk'
require 'rakai/s3000/volume'
require 'rakai/s3000/partition'

module Rakai
  module S3000    
=begin rdoc
  
Unable to find any info about disks with multiple partitions, so this is from my 
own experimentation using an S2000 with an internal SCSI SD card drive.

=end
    class Disk < Rakai::Base::Disk
      MAX_SIZE = 536870912 # 512MB

      array :partitions, read_until: -> {
        is_valid = element.valid?
        is_valid &= @prev_length == element.length unless @prev_length.nil?
        @prev_length = element.length
        !is_valid
      } do
        partition partition_index: :index
      end
    end

    def to_s
      partitions.collect { |part| part.to_s }.join("\n")
    end
  end
end

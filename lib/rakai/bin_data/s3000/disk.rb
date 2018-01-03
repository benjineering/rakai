require 'rakai/bin_data/base'
require 'rakai/bin_data/s3000/volume'
require 'rakai/bin_data/s3000/partition'

module Rakai
  module BinData
    module S3000    
=begin rdoc
  
Unable to find any info about disks with multiple partitions, so this is from my 
own experimentation using an S2000 with an internal SCSI SD card drive.

=end
      class Disk < Rakai::BinData::Base
        MAX_BLOCKS = 65536
        MAX_SIZE = 536870912 # 512MB

        array :partitions, read_until: -> {
          is_valid = element.valid?
          is_valid &= @prev_length == element.len unless @prev_length.nil?
          @prev_length = element.len
          !is_valid
        } do
          partition partition_index: :index
        end
      end
    end
  end
end

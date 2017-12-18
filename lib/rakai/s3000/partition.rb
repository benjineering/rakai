require 'rakai/base/partition'
require 'rakai/s1000/akai_string'

module Rakai
  module S3000
=begin rdoc
  
Unable to find any info about disks with multiple partitions, so this is from my
own experimentation using an S2000 with an internal SCSI SD card drive.

=end


    class Partition < Rakai::Base::Partition
      MAX_VOLUMES = 100
      END_MARKER = 4095
      LETTERS = ('A'..'Z').to_a

      mandatory_parameter :partition_index

      uint16 :block_count

      buffer :buffer, length: -> { length }, onlyif: -> { valid? } do
        uint16 :dummy

        #array :volumes, initial_length: MAX_VOLUMES do
        #  volume
        #end
      end

      virtual :i, value: :partition_index

      def length
        if block_count == END_MARKER || block_count == 0
          return 0
        else
          return block_count * BLOCK_SIZE - 2
        end
      end

      def valid?
        length > 0
      end

      def to_s
        letter = LETTERS[i]
        mb = (length.to_f / 1024 / 1024).ceil
        "#{letter}: #{mb}MB"
      end
    end
  end
end

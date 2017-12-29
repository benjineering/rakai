require 'rakai/bin_data/base'
require 'rakai/bin_data/s1000/akai_string'
require 'rakai/bin_data/s3000/volume_index_entry'

module Rakai
  module BinData
    module S3000
=begin rdoc
  
Unable to find any info about disks with multiple partitions, so this is from my
own experimentation using an S2000 with an internal SCSI SD card drive.

=end
      class Partition < Rakai::BinData::Base
        MAX_VOLUMES = 100
        END_MARKER = 4095
        LETTERS = ('A'..'Z').to_a

        mandatory_parameter :partition_index
        #mandatory_parameter :partition_offset

        uint16 :block_count

        buffer :buffer, length: -> { length }, onlyif: -> { valid? } do
          skip length: 200

          array :volume_index, read_until: -> { !element.valid? } do
            volume_index_entry
          end

          #skip to_abs_offset: -> { volume_index.first.offset }, onlyif: -> { partition_index == 0 }
          #
          #volume :vol, onlyif: -> { partition_index == 0 }
        end

        virtual :i, value: :partition_index
        #virtual :offset, value: :partition_offset

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

        def name
          LETTERS[i]
        end

        def to_s
          letter = LETTERS[i]
          mb = (length.to_f / 1024 / 1024).ceil
          vol_entries = buffer.volume_index.collect { |v| v.to_s }.join("\n")
          "#{letter}: #{mb}MB\n#{vol_entries}\n#{buffer.vol.to_s}"
        end
      end
    end
  end
end

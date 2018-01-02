require 'rakai/bin_data/s3000/disk'
require 'rakai/model/s3000/partition'

module Rakai
  module Model
    module S3000
      class Disk
        attr_reader :partitions

        def initialize(path)
          @file = ::File.open(::File.expand_path(path))
          data = Rakai::BinData::S3000::Disk.read(@file)
          current_offset = 0
          @partitions = {}

          data.partitions.each_with_index do |p, i|
            part = Partition.new(@file, p, i, current_offset)
            @partitions[part.name] = part
            current_offset += part.length
          end
        end

        def path
          @file.path
        end

        def partition(name)
          partitions[Partition.clean_partition_letter(name)]
        end
      end
    end
  end
end

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
          @partitions = {}

          data.partitions.each do |p|
            part = Partition.new(@file, p)
            @partitions[part.name] = part
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

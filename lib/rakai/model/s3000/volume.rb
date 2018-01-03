require 'rakai/bin_data/s3000/volume'
require 'rakai/model/s3000/file'

module Rakai
  module Model
    module S3000
      class Volume
        attr_reader :name, :files

        def initialize(file, index_entry_or_name, partition_or_volume_offset)
          @file = file
          @read = false

          if index_entry_or_name.is_a?(String)
            @name = index_entry_or_name
            @offset = partition_or_volume_offset
          else
            @name = index_entry_or_name.name.to_s
            @offset = index_entry_or_name.offset + partition_or_volume_offset
          end
        end

        def read
          v = dup
          v.read!
          v
        end

        def read!
          @files = []
          @file.seek(@offset)
          data = Rakai::BinData::S3000::Volume.read(@file)

          data.file_index.each do |e|
            break unless e.valid?
            @files << File.new(e)
          end

          @read = true
        end

        def read?
          @read
        end

        def dup
          Volume.new(@file, @name, @offset)
        end
      end
    end
  end
end

require 'rakai/bin_data/s3000/volume'
require 'rakai/model/s3000/file'

module Rakai
  module Model
    module S3000
      class Volume
        attr_reader :name, :files

        def initialize(file, index_entry, offset)
          @file = file
          @read = false
          @name = index_entry.name.to_s
          @offset = index_entry.offset + offset
        end

        def read!
          @file.seek(@offset)
          data = Rakai::BinData::S3000::Volume.read(@file)
          @files = []

          data.file_index.each do |e|
            @files << File.new(e)
          end

          @read = true
        end

        def read?
          @read
        end
      end
    end
  end
end

module Rakai
  module Model
    module S3000
      class File
        require 'rakai/model/s3000/sample'

        TYPES = {
          240 => :program,
          243 => :sample,
          120 => :effects,
          237 => :multi
        }
        attr_reader :name, :type, :length, :offset, :file

        def initialize(file, entry)
          @entry = entry
          @file = file
          @name = entry.file_name.to_s
          @type = TYPES[entry.file_type.first]
          @length = entry.file_length.to_i
          @offset = entry.offset
        end

        def to_sample
          Sample.new(@file, @entry)
        end
      end
    end
  end
end

require 'rakai/model/s3000/volume'

module Rakai
  module Model
    module S3000
      class Partition
        LETTERS = ('A'..'Z').to_a

        attr_reader :name, :volumes, :offset, :length

        def initialize(file, data, index, offset)
          @offset = offset
          @length = data.len
          @name = Partition.clean_partition_letter(LETTERS[index])
          @volumes = {}

          data.buffer.volume_index.each do |v|
            break unless v.valid?
            vol = Volume.new(file, v, @offset)
            @volumes[vol.name.upcase] = vol
          end
        end

        def volume(name)
          @volumes[name.upcase]
        end

        def self.clean_partition_letter(letter)
          letter.upcase.to_sym
        end
      end
    end
  end
end

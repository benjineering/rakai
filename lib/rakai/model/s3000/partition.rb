require 'rakai/model/s3000/volume'

module Rakai
  module Model
    module S3000
      class Partition
        LETTERS = ('A'..'Z').to_a

        attr_reader :name, :volumes, :offset, :length

        def initialize(file, data, index, offset)
          @offset = offset
          @length = data.length
          @name = Partition.clean_partition_letter(LETTERS[index])
          @volumes = []

          data.volume_index.each do |v|
            @volumes << Volume.new(file, v, @offset)
          end
        end

        def self.clean_partition_letter(letter)
          letter.upcase.to_sym
        end
      end
    end
  end
end

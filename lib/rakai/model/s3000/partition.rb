require 'rakai/model/s3000/volume'

module Rakai
  module Model
    module S3000
      class Partition
        attr_reader :name, :volumes

        def initialize(file, data)
          @name = Partition.clean_partition_letter(data.name.to_s)
          @volumes = []

          data.volume_index.each do |v|
            @volumes << Volume.new(file, v, 0) # TODO: fix offset
          end
        end

        def self.clean_partition_letter(letter)
          letter.upcase.to_sym
        end
      end
    end
  end
end

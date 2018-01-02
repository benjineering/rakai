require 'rakai/bin_data/base'

module Rakai
  module BinData
    module S3000
      class VolumeIndexEntry < Rakai::BinData::Base
        akai_string :name, length: 12
        uint16 :start_block
        uint16 :num

        def valid?
          start_block > 0
        end

        def offset
          start_block * BLOCK_SIZE
        end
      end
    end
  end
end

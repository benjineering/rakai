require 'rakai/bin_data/base'
require 'rakai/bin_data/s900/index_entry'

module Rakai
  module BinData
    module S900
      class Volume < Rakai::BinData::Base
        array :file_index, type: :index_entry, initial_length: 64
      end
    end
  end
end

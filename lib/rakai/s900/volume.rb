require 'rakai/base/volume'
require 'rakai/s900/index_entry'

module Rakai
  module S900
    class Volume < Rakai::Base::Volume
      array :file_index, type: :index_entry, initial_length: 64
    end
  end
end

require 'rakai/base/base'

module Rakai
  module Base
    class IndexEntry < Base
      
      def valid?
        file_length > 0
      end
    end
  end
end

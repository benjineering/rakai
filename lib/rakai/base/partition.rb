require 'rakai/base/base'

module Rakai
  module Base
    class Partition < Base

      def valid?
        start_block > 0
      end
    end
  end
end

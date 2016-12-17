require 'rakai/base/base'

module Rakai
  module Base
    class IndexEntry < Base
      
      def valid?
        file_length > 0
      end

      def to_s
        puts "'#{file_name}', type: '#{file_type}', length: '#{file_length}', start: '#{start_block}'"
      end
    end
  end
end

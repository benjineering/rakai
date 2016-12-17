require 'rakai/base/base'

module Rakai
  module Base
    class Sample < Base

      def to_s
        puts "#{file_name} length: #{sample_word_count}, rate: #{sample_rate}Hz"
      end
    end
  end
end

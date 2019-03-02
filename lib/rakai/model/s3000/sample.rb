require 'rakai/model/s3000/file'
require 'rakai/bin_data/s3000/sample'

module Rakai
  module Model
    module S3000
      class Sample < Rakai::Model::S3000::File
        attr_reader :freq, :pcm

        def read!
          @file.seek(@offset)
          data = Rakai::BinData::S3000::Sample.read(@file)
          @freq = data.frequency
          @pcm = data.sample_data.to_a.drop_while { |s| s == 0 }
        end
      end
    end
  end
end

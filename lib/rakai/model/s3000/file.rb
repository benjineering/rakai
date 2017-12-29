

module Rakai
  module Model
    module S3000
      class File
        attr_reader :name

        def initialize(entry)
          @name = entry.file_name
        end
      end
    end
  end
end

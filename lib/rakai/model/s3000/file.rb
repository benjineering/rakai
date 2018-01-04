

module Rakai
  module Model
    module S3000
      class File
        TYPES = {
          240 => :program,
          243 => :sample,
          120 =>:effects,
          237 => :multi
        }

        attr_reader :name, :type

        def initialize(entry)
          @name = entry.file_name.to_s
          @type = TYPES[entry.file_type.first]
        end
      end
    end
  end
end

require 'rakai/cli_view/base'

module Rakai
  module CLIView
    class Partition < Base
      def headings
        ['Volume', 'Entries']
      end

      def render
        table("Partition #{@model.name}") do |t|
          @model.volumes.each_with_index do |v, i|
            files = v.read.files

            files.collect! do |f|
              "#{f.type}: #{f.name.to_s}"
            end

            t.add_separator unless i == 0
            t << [v.name, files.join("\n")]
          end
        end
      end
    end
  end
end

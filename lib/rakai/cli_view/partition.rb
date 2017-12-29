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
            #files = v.files.collect { |f| f.name }.join("\n")
            t.add_separator unless i == 0
            t << [v.name, '']
          end
        end
      end
    end
  end
end

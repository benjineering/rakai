require 'rakai/cli_view/base'

module Rakai
  module CLIView
    class Disk < Base
      def headings
        ['Partition', 'Volumes']
      end

      def render
        table("Disk at #{@model.path}") do |t|
          @model.partitions.values.each_with_index do |p, i|
            vols = p.volumes.collect { |v| v.name }.join("\n")
            t.add_separator unless i == 0
            t << [p.name, vols]
          end
        end
      end
    end
  end
end

require 'rakai/cli_view/base'

module Rakai
  module CLIView
    class Volume < Base
      def headings
        ['File', 'Details']
      end

      def render
        table("Volume #{@model.name}") do |t|
          @model.files.values.each_with_index do |f, i|
            details = f.instance_variables.collect do |k|
              key = k.to_s[1, k.length - 1]
              value = f.instance_variable_get(k)
              "#{key}: #{value}"
            end

            t.add_separator unless i == 0
            t << [f.name, details.join("\n")]
          end
        end
      end
    end
  end
end

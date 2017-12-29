require 'terminal-table'

module Rakai
  module CLIView
    class Base
      STYLE = { width: 80, padding_left: 1, padding_right: 1 }
      Table = Terminal::Table

      def initialize(model)
        @model = model
      end

      def table(title = nil, style = {})
        s = STYLE.dup
        s.merge!(style)
        title = title.nil? ? '' : title + ":\n"

        title_width = STYLE[:width] - 
          STYLE[:padding_left] - 
          STYLE[:padding_right] -
          3

        title.gsub!(/(.{#{title_width}})(?=.)/, "\\1 \n \\2")

        #require 'byebug'; byebug

        Table.new(title: title, headings: headings, style: s) { |t| yield t }
      end

      def render
        raise NotImplementedError.new
      end

      def headings
        []
      end
    end
  end
end

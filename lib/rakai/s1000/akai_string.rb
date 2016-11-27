
=begin rdoc
Character    ASCII       AKAII
----------------------------------
 0 - 9       48 - 57     0 - 9              
 space       32          10
 A - Z       65 - 90     11 - 36
 #           35          37
 +           43          38
 -           45          39
 .           46          40
=end
module Rakai
  module S1000
    class AkaiString < BinData::Primitive
      mandatory_parameter :length

      alias_method :to_ascii, :to_s

      array :data, :initial_length => :length do
        bit8le
      end

      def get
        self.data
      end

      def set(v)
        self.data = v;
      end

      def empty?
        is_empty = true
        
        self.data.each do |byte|
          unless byte == 10
            is_empty = false
            break
          end
        end
        
        is_empty
      end

      def to_ascii
        str = ''

        self.data.each do |byte|      
          chr = AkaiString.byte_to_ascii(byte)
          str += chr unless chr.nil?
        end

        str
      end

      # Returns a character, or nil if byte is not valid Akai String format
      def self.byte_to_ascii(byte)
        num = case byte
          when 0..9
            byte + 48
          when 10
            32
          when 11..36
            byte + 54
          when 37
            35
          when 38
            43
          when 39
            45
          when 40
            46
          else
            nil
          end

          num.nil? ? "^#{byte.to_s}$" : num.chr
      end
    end
  end
end

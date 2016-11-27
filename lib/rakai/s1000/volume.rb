require 'bindata'

module Rakai
  module S1000
    
    # Each S1000 formatted disk consists of one or more volumes
    class Volume < BinData::Record

      # A listing of samples and programs contained on the volume
      array :file_index, initial_length: 64 do
        s1000_index_entry
      end

    =begin
      # Bytes 1536 to 3136 (1536 to 4736 for high density) contain a map of how the
      # blocks on the disk are used, in the form of 2-byte unsigned integers.
      #
      # The S1000 map uses a value of 19152 as an end marker, and the first
      # five blocks (file entries and map) are marked with values of 16384.
      array :file_map, read_until: lambda { element == 19152 } do
        uint16
      end
    =end

      # TODO: samples and programs (and others?) depending on the index
    end
  end
end

require 'bindata'

module Rakai
  module S3000
    
=begin rdoc
    The S3000 disk has space for file entries and map the same as for the S1000,
    but has a value of 255 at byte 17 signifying that these file entries will be 
    ignored, and 512 entries starting at block 5 will be used instead. 

    The first 17 map entries are marked with the value 16384.
=end
    class Volume < BinData::Record

=begin
      # Unused - probably legacy from S1000
      array :s1000_index, initial_length: 5 do
        s1000_index_entry
      end
=end

      # A listing of samples and programs contained on the volume
      array :file_index, initial_length: 64 do
        s3000_index_entry
      end

    end
  end
end

require 'rakai/s900/volume'
require 'rakai/version'

module Rakai
  BLOCK_SIZE = 1024
end

disk_file = File.open('/Users/ben/repos/rakai/spec/disk_images/S900/808.img')
s9000_808 = Rakai::S900::Volume.read(disk_file)

entry = s9000_808.indices.first
puts entry

disk_file.seek(entry.start_block * Rakai::BLOCK_SIZE)
sample_header = Rakai::S900::Sample.read(disk_file)
puts sample_header

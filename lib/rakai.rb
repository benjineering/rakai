require 'rakai/s900/volume'
require 'rakai/version'
require 'wavefile'

include WaveFile

module Rakai
  BLOCK_SIZE = 1024
end

disk_file = File.open('/Users/ben/repos/rakai/spec/disk_images/S900/808.img')
s9000_808 = Rakai::S900::Volume.read(disk_file)

entry = s9000_808.indices.first
puts entry

disk_file.seek(entry.start_block * Rakai::BLOCK_SIZE)
sample = Rakai::S900::Sample.read(disk_file)
puts sample

format = Format.new(:mono, :pcm_16, sample.sample_rate.to_i)
buffer = Buffer.new(sample.pcm, format)


Writer.new("/Users/ben/Desktop/#{sample.file_name}.wav", format) do |writer|
  writer.write(buffer)
end

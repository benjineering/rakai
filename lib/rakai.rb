require 'rakai/s900/volume'
require 'rakai/version'
require 'wavefile'

include WaveFile


module Rakai
  BLOCK_SIZE = 1024
end


image_name = 'sk1'
disk_file = File.open("/Users/ben/repos/rakai/spec/disk_images/S900/#{image_name}.img")
volume = Rakai::S900::Volume.read(disk_file)

volume.indices.each do |entry|
  if entry.file_type == "S"
    puts entry

    disk_file.seek(entry.start_block * Rakai::BLOCK_SIZE)
    sample = Rakai::S900::Sample.read(disk_file)

    format = Format.new(:mono, :pcm_16, sample.sample_rate.to_i)
    buffer = Buffer.new(sample.pcm, format)
    file_name = sample.file_name.to_s.rstrip

    Writer.new("/Users/ben/Desktop/#{file_name}.wav", format) do |writer|
      writer.write(buffer)
    end
  end
end

require 'rakai/s900/sample'
require 'rakai/s900/volume'

require 'rakai/s3000/disk'
require 'rakai/s3000/partition'
require 'rakai/s3000/sample'
require 'rakai/s3000/volume'

require 'rakai/version'

require 'wavefile'

include WaveFile

#image_name = '3MB_partitions_A_to_Q'
image_name = '60MB_partitions_A_to_I'
image_format = Rakai::S3000

disk_dir = image_format.to_s.split('::').last
disk_path = "/Users/ben/repos/rakai/spec/disk_images/#{disk_dir}/#{image_name}.akai"
disk_file = File.open(disk_path)

puts image_name

#BinData::trace_reading do
  image_format::Disk.read(disk_file).partitions.each do |part|
    puts part.to_s
    puts
  end
#end

=begin
disk = image_format::Disk.read(disk_file)

disk.partitions.each do |part|
  part.volumes.each do |vol|
    puts vol.name.to_s
  end
end
=end

=begin
idx = 0
File.open("/Users/ben/Desktop/#{image_name}.txt", 'w') do |file|
  begin
    loop do
      chr = Rakai::S1000::AkaiString.byte_to_ascii(disk_file.readbyte)
      chr.nil? ? file << '~' : file << chr
      idx += 1
    end
  rescue
  end
end
=end

require 'rakai/s900/sample'
require 'rakai/s900/volume'

require 'rakai/s3000/disk'
require 'rakai/s3000/sample'
require 'rakai/s3000/volume'
require 'rakai/s3000/volume_entry'

require 'rakai/version'

require 'wavefile'

include WaveFile

image_name = 'black_tar_test_rdisk.akai'
image_format = Rakai::S3000

disk_dir = image_format.to_s.split('::').last
disk_path = "/Users/ben/repos/rakai/spec/disk_images/#{disk_dir}/#{image_name}"
disk_file = File.open(disk_path)

disk = image_format::Disk.read(disk_file)

disk.volume_index.each do |volume_entry|
  puts volume_entry
end

require 'rakai/s900/volume'

disk_file = File.open('/Users/ben/repos/rakai/spec/disk_images/808.img')
puts Rakai::S900::Volume.read(disk_file)

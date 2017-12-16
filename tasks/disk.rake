require 'rakai/s3000/disk'

namespace :disk do
  task :default => :dump

  desc 'Dump the usable part of the disk to a file'
  task :dump do
    Disk = Rakai::S3000::Disk

    puts `diskutil list`
    puts 'ENTER DISK IDENTIFIER TO READ FROM:'
    disk = STDIN.gets.chomp

    puts 'ENTER OUTPATH:'
    out = STDIN.gets.chomp

    cmd = "sudo dd if=/dev/#{disk} of=#{out} "\
      "bs=#{Disk::BLOCK_SIZE} count=#{Disk::MAX_BLOCKS}"
    puts cmd
    exec(cmd)
  end
end

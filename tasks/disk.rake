require 'rakai/s3000/disk'
require 'optparse'

namespace :disk do
  task :default => :dump

  desc 'Dump the usable part of the disk to a file'
  task :dump do
    Disk = Rakai::S3000::Disk

    options = {
      disk: '/dev/disk1',
      out: File.expand_path('~/Desktop/x.akai'),
      block_size: Disk::BLOCK_SIZE,
      block_count: Disk::MAX_BLOCKS
    }

    o = OptionParser.new do |opts|
      opts.banner = 'Usage: rake disk:dump options'

      opts.on('--disk DISK_ID', 'Disk identifier (e.g. disk2)') do |d| 
        options[:disk] = "/dev/#{d}"
      end

      opts.on('--out OUTPUT_PATH', 'Output path (e.g. ~/Desktop/x.akai)') do |o|
        options[:out] = File.expand_path(o)
      end

      opts.on('--block-size BLOCK_SIZE', 'Block size (e.g. 1024)') do |b|
        options[:block_size] = b
      end

      opts.on('--block-count BLOCK_COUNT', 'Block count - number of blocks of BLOCK_SIZE') do |b|
        options[:block_count] = File.expand_path(b)
      end
    end

    args = o.order!(ARGV) {}
    o.parse!(args)

    cmd = "sudo dd if=#{options[:disk]} of=#{options[:out]} "\
      "bs=#{options[:block_size]} count=#{options[:block_count]}"
    puts cmd
    exec(cmd)
  end
end

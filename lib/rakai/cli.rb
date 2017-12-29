require 'thor'
require 'rakai/cli_view/disk'
require 'rakai/cli_view/partition'
require 'rakai/model/s3000/disk'
require 'rakai/model/s3000/partition'

module Rakai
  class CLI < Thor
    Disk = Model::S3000::Disk
    Volume = Model::S3000::Volume
    DiskView = CLIView::Disk
    PartitionView = CLIView::Partition

    desc 'disk PATH', 'reads an AKAI formatted disk at PATH'
    def disk(path)
      disk = Disk.new(path)
      view = DiskView.new(disk)
      puts view.render
    end

    desc 'partition LETTER PATH', 'reads a partition by letter'
    def partition(letter, path)
      disk = Disk.new(path)
      partition = disk.partition(letter)
      view = PartitionView.new(partition)
      puts view.render
    end
  end
end

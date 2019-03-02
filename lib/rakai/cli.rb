require 'thor'
require 'easy_audio'

require 'rakai/cli_view/disk'
require 'rakai/cli_view/partition'
require 'rakai/cli_view/volume'
require 'rakai/model/s3000/disk'

module Rakai
  class CLI < Thor
    Disk = Model::S3000::Disk
    Volume = Model::S3000::Volume
    DiskView = CLIView::Disk
    PartitionView = CLIView::Partition
    VolumeView = CLIView::Volume

    desc 'disk PATH', 'reads an AKAI formatted disk'
    def disk(path)
      disk = Disk.new(path)
      view = DiskView.new(disk)
      puts view.render
    end

    desc 'partition PARTITION PATH', 'reads a partition by letter'
    def partition(partition_letter, path)
      disk = Disk.new(path)
      partition = disk.partition(partition_letter)
      view = PartitionView.new(partition)
      puts view.render
    end

    desc 'volume PARTITION VOLUME PATH',
    'reads a volume by partition letter and volume name'
    def volume(partition_letter, volume_name, path)
      disk = Disk.new(path)
      partition = disk.partition(partition_letter)
      volume = partition.volume(volume_name)
      volume.read!
      view = VolumeView.new(volume)
      puts view.render
    end

    desc 'sample PARTITION VOLUME NAME PATH', 'plays a sample'
    def sample(partition_letter, volume_name, sample_name, path)
      disk = Disk.new(path)
      partition = disk.partition(partition_letter)
      volume = partition.volume(volume_name)
      volume.read!
      sample = volume.files[sample_name].to_sample
      sample.read!

      EasyAudio.easy_open(sample_rate: sample.freq) do
        sample.pcm.shift
      end

      sleep 2
    end
  end
end

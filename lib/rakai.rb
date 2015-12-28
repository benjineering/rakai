require 'bindata'

=begin rdoc

Character    ASCII       AKAII
----------------------------------
 0 - 9       48 - 57     0 - 9              
 space       32          10
 A - Z       65 - 90     11 - 36
 #           35          37
 +           43          38
 -           45          39
 .           46          40

=end
class AkaiString < BinData::Primitive
  mandatory_parameter :length

  string :data, :length => :length

  def get
    # TODO: translate
    self.data
  end

  def set(v)
    self.data = v;
  end
end


# A 3 byte long, big endian unsigned integer
class Uint24be < BinData::Primitive
  endian :big

  uint8 :byte1
  uint8 :byte2
  uint8 :byte3

  def get
    (self.byte1 << 16) | (self.byte2 << 8) | self.byte3
  end

  def set(v)
    v = 0 if v < 0
    v = 0xffffff if v > 0xffffff

    self.byte1 = (v >> 16) & 0xff
    self.byte2 = (v >>  8) & 0xff
    self.byte3 =  v        & 0xff
  end
end


# Each S1000 volume begins with 64 index entries
class S1000IndexEntry < BinData::Record
  endian :big

  # 12 char AKAI string file name
  akai_string :file_name, length: 12

  # 32,32,32,32 for S1000
  array :four_ints, initial_length: 4 do
    uint8 initial_value: 32
  end

  # 's'=sample, 'p'=program, etc.
  uint8 :file_type

  # file length in bytes. Value is 3 bytes long
  uint24 :file_length

  # starting block on disk
  uint16 :starting_block

  # S1000 ID = 0,3
  array :version_id, initial_length: 2 do
    uint8 initial_value: [ 0, 3 ]
  end
end


class S1000Program < BinData::Record
  endian :big

  # TODO
end


class S1000Sample < BinData::Record
  endian :big

  # TODO
end


# Each S1000 formatted disk consists of one or more volumes
class S1000Volume < BinData::Record
  endian :big

  # A listing of samples and programs contained on the volume
  array :file_index, initial_length: 64 do
    s1000_index_entry
  end

=begin
  # Bytes 1536 to 3136 (1536 to 4736 for high density) contain a map of how the
  # blocks on the disk are used, in the form of 2-byte unsigned integers.
  #
  # The S1000 map uses a value of 19152 as an end marker, and the first
  # five blocks (file entries and map) are marked with values of 16384.
  array :file_map, read_until: lambda { element == 19152 } do
    uint16
  end
=end

  # TODO: samples and programs (and others?) depending on the index
end


# Users should start here
class Rakai

  # Maximum usable disk size is 512MB
  MAX_DISK_BYTES = 536870912

  def read(disk)
    disk = File.open(disk)
    vol1 = S1000Volume.read(disk)

    vol1.file_index.each do |entry|
      puts "Entry file name: #{entry.file_name}"
    end
  end
end

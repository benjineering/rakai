require 'bindata'

class AkaiString < BinData::Record
  
end

class S1000Format < BinData::Record
  # array of S1000File
end

class S1000File < BinData::Record
  # header
  # entry
end

class Rakai
  MAX_DISK_BYTES = 536870912 # 512MB

end

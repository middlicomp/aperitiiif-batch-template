require 'fileutils'

SERVICE_NAMESPACE    = 'serverless-iiif-'
COLLECTION_NAMESPACE = "#{File.basename(FileUtils.pwd).gsub(SERVICE_NAMESPACE, '')}"
SRC_DIR              = 'src'
NEW_SRC              = 'tmp'

require_relative 'image/tifs'
require_relative 'presentation/json'

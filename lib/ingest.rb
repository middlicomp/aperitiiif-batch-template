require 'fileutils'

SERVICE_NAMESPACE       = 'serverless-iiif-'
COLLECTION_NAMESPACE    = "#{File.basename(FileUtils.pwd).gsub(SERVICE_NAMESPACE, '')}"

SRC_DIR                 = 'src'
BUILD_DIR               = 'build'
IMAGE_BUILD_DIR         = "#{BUILD_DIR}/image"
PRESENTATION_BUILD_DIR  = "#{BUILD_DIR}/presentation"

PRESENTATION_API_URL    = 'https://nyu-dss-serverless-iiif-presentation-test.s3.us-east-1.amazonaws.com'
IMAGE_API_URL           = 'https://twt4gwyokx4jxgo2tcptgtn4v40qajbb.lambda-url.us-east-1.on.aws/iiif/2'

require_relative 'image/tifs'
require_relative 'presentation/json'

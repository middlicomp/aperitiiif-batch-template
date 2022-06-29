require 'fileutils'

SERVICE_NAMESPACE    = 'serverless-iiif-'
COLLECTION_NAMESPACE = "#{File.basename(FileUtils.pwd).gsub(SERVICE_NAMESPACE, '')}"
SRC_DIR              = 'src'
NEW_SRC              = 'tmp'

FileUtils.mkdir_p NEW_SRC

files = Dir.glob("#{SRC_DIR}/**/*").select { |f| File.file? f }
files.each do |p|
  base = p.gsub(SRC_DIR, '').split('/').reject(&:empty?)
  namespaced = base.prepend(COLLECTION_NAMESPACE).join('_')
  
  FileUtils.cp p, "#{NEW_SRC}/#{namespaced}"
end

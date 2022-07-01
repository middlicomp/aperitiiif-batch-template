require 'fileutils'
require 'vips'


FileUtils.mkdir_p IMAGE_BUILD_DIR

files = Dir.glob("#{SRC_DIR}/**/*").select { |f| File.file? f }
files.each do |f|
  base_path     = f.gsub(SRC_DIR, '').split('/').reject(&:empty?)
  renamed_file  = "#{IMAGE_BUILD_DIR}/#{base_path.prepend(COLLECTION_NAMESPACE).join('_')}"

  FileUtils.cp f, renamed_file

  image   = Vips::Image.new_from_file renamed_file
  tiffile = renamed_file.gsub(File.extname(renamed_file), '.tif')

  image.write_to_file tiffile
  FileUtils.rm renamed_file
end

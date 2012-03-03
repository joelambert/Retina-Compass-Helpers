###
#
# Retina helper mixins for Compass
# http://www.joelambert.co.uk
# 
# Copyright 2012, Joe Lambert.
# Free to use under the MIT license.
# http://joelambert.mit-license.org/
#
###

module Compass::SassExtensions::Functions::Files
  # Does the supplied image exists?
  def file_exists(image_file)
    path = image_file.value
    # Compute the real path to the image on the file system if the images_dir is set.
    if Compass.configuration.images_path
      path = File.join(Compass.configuration.images_path, path)
    else
      path = File.join(Compass.configuration.project_path, path)
    end
    
    Sass::Script::Bool.new(File.exists?(path))
  end
  
  # Generate a filename with @2x appended to the end
  def retina_filename(image_file)
    filename = image_file.value
    parts = filename.split('.')
    ext = parts.pop
    f = parts.pop
    f = f + "@2x"
    parts.push(f)
    parts.push(ext)
    Sass::Script::String.new(parts.join('.'))
  end
end

module Sass::Script::Functions
  include Compass::SassExtensions::Functions::Files
end
# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # include CarrierWave::MiniMagick

  storage :file
  # storage :fog

  #Default preset
  # process :resize_to_limit =>[1024, 10000]

  def thumb(size)
    return nil if ! File.exist? File.join(CarrierWave.root, self.url)
    uploader = Class.new(self.class)
    uploader.version_names = [size]
    img = uploader.new(model, mounted_as)
    img.retrieve_from_store!(identifier)
    cached = File.join([img.url, File.basename(self.url)].join('_') )
    return cached if File.exist?(File.join(CarrierWave.root, cached))
    
    img.cache!(self)
    img.quality(100)
    resizer = case size
              when /xF/ then :resize_to_fill
              when /xL/ then :resize_to_limit
              when /xP/ then :resize_and_pad
              # add more like when /x./ then ...
              else :resize_to_fit
              end
              
    middle =  /[\d]+([\D]+)[\d]+/.match size
    size = size.split(middle[1]).map(&:to_i)
    img.send(resizer, *size)

    img.store! 
    img
  end

  def default_url
    ActionController::Base.helpers.asset_path("layout/" + [version_name, "default.png"].compact.join('_'))
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end

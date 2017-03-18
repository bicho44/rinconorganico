#I want to practically mimic this https://github.com/cloudinary/cloudinary_gem/blob/master/lib/cloudinary/helper.rb
#to be able to migrate to cloudinary in a snap
module ImageCacheHelper
  include ActionView::Helpers::AssetTagHelper  
  alias :original_image_tag :image_tag
  alias :original_image_path :image_path

  def ic_image_tag(source, options = {})
    options = options.clone
    source = (options[:size] ) ? source.thumb(options[size]) : source
    options[:width] = options.delete(:html_width) if options.include?(:html_width)
    options[:height] = options.delete(:html_height) if options.include?(:html_height)
    options[:size] = options.delete(:html_size) if options.include?(:html_size)
    options[:border] = options.delete(:html_border) if options.include?(:html_border)
    original_image_tag(source, options)
  end

end
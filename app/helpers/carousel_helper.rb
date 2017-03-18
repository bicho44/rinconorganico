module CarouselHelper

  def carousel(args = {})
    sliders = args.fetch(:sliders) {[]}
    images  = args.fetch(:images)  {[]}
    image_sliders = images.map{|i| image_tag(i)}
    sliders = sliders+image_sliders
    concat(render partial: "shared/carousel", locals: {sliders: sliders})
  end
end

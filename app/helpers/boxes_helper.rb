module BoxesHelper

  def seed_box(size = "wide short", klass="", &block)
    if block_given?
      concat(render :partial => "shared/seed_box", locals: {size: size,klass: klass, content: capture(&block)})
    end
  end

  def search_box(path, klass="")
    concat(render :partial => "shared/search_box", locals: {path: path, klass: klass})
  end

end

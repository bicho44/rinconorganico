module BannerSlatsHelper
  def recipe_banner_slats(quantity = 1)
    recipes = Recipe.limit(quantity)
    return recipes.map{|recipe| render(partial: '/shared/rightbanner/recipe', locals: {x: recipe })}
  end

  def product_banner_slats(quantity = 1)
    products = Product.published.featured.limit(quantity)
    return products.map{|product| render(partial: '/shared/rightbanner/product', locals: {x: product })}
  end

  def blog_banner_slats(quantity = 1)
    notes = Note.blog.published.limit(quantity)
    return notes.map{|note| render(partial: '/shared/rightbanner/blog', locals: {x: note })}
  end

  def testimonial_banner_slats(quantity=1)
    testimonies = Testimony.limit(quantity)
    testimonies.map { |testimony| render(partial: '/shared/rightbanner/testimonial', locals: {x: testimony }) }
  end

  def biobar_banner_slats()
    return []
  end

  def certification_banner_slats(quantity = 1)
    certifications = Certification.limit(quantity)
    return certifications.map{|certification| render(partial: '/shared/rightbanner/certification', locals: {x: certification })}
  end

  def cv_banner_slats
    render(partial: '/shared/rightbanner/cv')
  end


  def sidebanner_join(banners = [])
    banners.flatten!
    return banners.join('<div class="l-dots-divider"></div>').html_safe
  end


end
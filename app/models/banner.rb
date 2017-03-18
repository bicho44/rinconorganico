class Banner < ActiveRecord::Base
  attr_accessible :banner_product_id, :banner_recipe_id, :banner_blog_id, :product_banner, :recipe_banner, :blog_banner
  belongs_to :product_banner, class_name: 'Product', foreign_key: :banner_product_id  
  belongs_to :recipe_banner, class_name: 'Recipe', foreign_key: :banner_recipe_id
  belongs_to :blog_banner, class_name: 'Note', foreign_key: :banner_blog_id

  def self.current
    self.first || self.create(product_banner: Product.first, recipe_banner: Recipe.first, blog_banner: Note.blog.published.first)
  end
end

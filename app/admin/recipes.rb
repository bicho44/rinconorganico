ActiveAdmin.register Recipe do
  menu :parent => "Shop"

  index do |i|
    column :picture do |x|
      image_tag(x.picture.thumb('50x50')) unless x.picture.blank?
    end
    column :title
    column :description do |x|
      truncate x.description, length: 80
    end
    column :cookings do |x|
      x.cookings.map{|c| c.product.title}.join(' - ')
    end
    default_actions
  end

  form do |f|                         
    f.inputs "Recipe details", :multipart => true do       
      f.input :title                  
      f.input :description               
      f.input :picture, :as => :file, :hint => f.object.picture.present? ? f.template.image_tag(f.object.picture.thumb('50x50')) : f.template.content_tag(:span, "no se ha cargado una imagen todavia")
    end               
    f.inputs "Ingredientes" do
      f.has_many :cookings do |f|
        f.input :product
        f.input :_destroy, as: :boolean
      end
    end
    f.actions                         
  end  

end

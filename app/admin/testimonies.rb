ActiveAdmin.register Testimony do
  menu :parent => "Blogs"
  
  index do
    column :title        
    column :description do |x|
      truncate x.description, length: 100
    end
    column :created_at
    column :updated_at             
    default_actions                   
  end  

  form do |f|                         
    f.inputs "Testimonio" do       
      f.input :title                  
      f.input :description
      f.input :picture, :as => :file, :hint => f.object.picture.present? ? f.template.image_tag(f.object.picture.thumb('50x50')) : f.template.content_tag(:span, "no se ha cargado una imagen todavia")
    end
    f.actions
  end
  
end
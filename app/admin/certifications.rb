ActiveAdmin.register Certification do
  menu :parent => "Blogs"

  index do |i|
    column :picture do |x|
      image_tag x.picture.thumb('50x50') unless x.picture.blank?
    end
    column :title
    column :description do |x|
      truncate x.description, length: 80
    end
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description, as: :html_editor
      f.input :picture, :as => :file, :hint => f.object.picture.present? ? f.template.image_tag(f.object.picture.thumb('50x50')) : f.template.content_tag(:span, "no se ha cargado una imagen todavia")
      f.input :created_at
    end
    f.actions
  end

end

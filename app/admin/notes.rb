ActiveAdmin.register Note do
  menu :parent => "Blogs"
  
  index do
    column :picture do |note|
      image_tag(note.picture.thumb('50x50')) unless note.picture.blank?
    end
    column :title
    column :description do |x|
      truncate strip_tags(x.description), length: 80
    end
    column :type do |note|
      t "activerecord.attributes.note.types.#{note.type}"
    end
    column :published
    column :is_featured
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|                         
    f.inputs "Note details" do       
      f.input :published
      f.input :is_featured
      f.input :title
      f.input :description, as: :html_editor
      f.input :picture, :as => :file, :hint => f.object.picture.present? ? f.template.image_tag(f.object.picture.thumb('50x50')) : f.template.content_tag(:span, "no se ha cargado una imagen todavia")
      f.input :type, collection: Note.types.map{|n| [t("activerecord.attributes.note.types.#{n}"), n ]}
      f.input :created_at
    end
    f.actions                         
  end  
  
end
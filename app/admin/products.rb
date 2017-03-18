ActiveAdmin.register Product do
  menu :parent => 'Shop'
  
  batch_action :publish do |selection|
    Product.find(selection).each do |p|
      p.publish!
    end
    redirect_to collection_path
  end

  batch_action :unpublish do |selection|
    Product.find(selection).each do |p|
      p.unpublish!
    end
    redirect_to collection_path
  end

  index do
    selectable_column
    column :picture do |x|
      image_tag(x.picture.thumb('50x50')) unless x.picture.blank?
    end
    column :category
    column :title
    column :description do |x|
      truncate x.description, length: 50
    end
    column :price do |x|
      number_to_currency x.price
    end
    column :measure
    column :producer
    column :published do |x|
      x.published ? t('formtastic.yes') : t('formtastic.no')
    end
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|                         
    f.inputs "Product Details", :multipart => true do       
      f.input :published
      f.input :is_featured
      f.input :is_sale
      f.input :title
      f.input :category
      f.input :producer
      f.input :description, as: :html_editor
      f.input :price
      f.input :measure
      f.input :picture, :as => :file, :hint => f.object.picture.present? ? f.template.image_tag(f.object.picture.thumb('50x50')) : f.template.content_tag(:span, "no se ha cargado una imagen todavia")
    end
    f.actions                         
  end  

end

ActiveAdmin.register Category do
  menu :parent => 'Shop'

  config.sort_order = "title_asc"

  index do |i|
    column :title        
    column :parent_id do |x|
      x.parent.title if x.parent
    end
    column :created_at
    column :updated_at             
    default_actions                   
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :parent_id, as: :select, collection: Category.roots #.reject{|c| c.id ==category.id} #where the hell is category?
    end
    f.actions
  end
  
  # index do |i|
  #   # raise i.methods(true).inspect
  #   # raise @object.inspect
  #   div do      
  #     panel("Latest notes") do
  #       table_for(users.limit(3)) do
  #         column :created_at
  #         # column :body
  #         # column "Actions" do |note|
  #         #   link_to admin_note_path(note)
  #         # end
  #       end
  #     end
  #   end
  # end
  
end

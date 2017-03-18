ActiveAdmin.register Order do
  menu :parent => 'Shop'
  #menu :priority => 2

  index do |i|
    column :id
    column :user
    column :first_name
    column :last_name
    column :shipping_address
    column :district
    column :total do |x|
      number_to_currency x.total
    end
    column :created_at
    default_actions
  end

  form do |f|      
    f.inputs "Detalles del pedido" do                    
      f.input :first_name
      f.input :last_name
      f.input :shipping_address
      f.input :district
      f.input :postal_code
      f.input :city
      f.input :phone
      f.input :cellular
      f.input :company
      f.input :cuit
      f.input :comments, as: :text, :input_html => { rows: 3}
    end
    f.actions                         
  end

  show do |order|
    attributes_table do
      row :id
      row :last_name
      row :shipping_address
      row :city
      row :postal_code
      row :phone
      row :cellular
      row :total do |x|
        number_to_currency x.total
      end
      row :created_at
    end
    
    panel("Items") do
      table_for order.order_items do
        column :title
        column :quantity
        column :price
        column :full_price
      end
    end

  end

end
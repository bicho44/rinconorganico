ActiveAdmin.register Banner do
  menu :parent => "Herramientas"
  
  config.filters = false
  config.clear_action_items!
  config.batch_actions = false

  controller do
    def index
      redirect_to edit_admin_banner_path(Banner.current)
    end

    def update
      banner = Banner.current
      if banner.update_attributes(params[:banner])
        flash.notice = 'Gracias'
      else
        flash.notice = 'No se pudo grabar'
      end
      redirect_to edit_admin_banner_path(Banner.current)
    end


  end

end

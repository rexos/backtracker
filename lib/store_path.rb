module StorePath

  def store_current_path( args = nil )
    if args.nil?
      set_default
    else
      if args[:path]
        args[:path] = args[:path] + "/" if args[:path][-1] != "/"
        args[:path] = args[:path].insert( 0, "/" ) if args[:path][0] != "/"
        session[:previous_path] = args[:path]
      elsif args[:controller] and args[:action]
        session[:previous_controller] = args[:controller]
        session[:previous_action] = args[:action]
      end
    end
  end

  def restore_previous_path
    if session[:previous_path]
      redirect_to session[:previous_path]
    else
      redirect_to :controller => session[:previous_controller], :action => session[:previous_action]
    end
  end

  private

  def set_default
    session[:previous_path] = request.fullpath
  end

end

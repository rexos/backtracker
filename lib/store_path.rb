module StorePath

  def store_current_path( path = nil )
    if path.nil?
      session[:previous_path] = request.fullpath
    else
      session[:previous_path] = path
    end
  end

  def restore_previous_path
    redirect_to session[:previous_path]
  end

end

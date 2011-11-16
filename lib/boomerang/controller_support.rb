module Boomerang::ControllerSupport
  def redirect_away(*args)
    session[:boomerang_return_path] = request.fullpath
    redirect_to *args
  end

  def redirect_back(*args)
    if return_uri = session[:boomerang_return_path]
      redirect_to return_uri
      session[:boomerang_return_path] = nil
    elsif args.empty?
      redirect_to '/'
    else
      redirect_to *args
    end
  end
end
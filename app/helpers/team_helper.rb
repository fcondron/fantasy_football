module TeamHelper
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

end
module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
  def logged_in?
    !current_user.nil?
  end
  def user_is_logged_in
    if current_user.nil?
        redirect_to sessions_new_path
    end
  end
end

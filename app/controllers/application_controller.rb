class ApplicationController < ActionController::Base
  before_action :set_cart
  before_action :cleanup_user_on_session_reset
  before_action :log_session_id
  def set_cart
    @cart = Cart.for_session(session.id.to_s)
  end

  private

  def cleanup_user_on_session_reset
    if session[:user_id] && session_expired?
      user = User.find_by(id: session[:user_id])
      user.destroy if user
      session[:user_id] = nil
    end
  end

  def session_expired?
    # Implement your session expiration logic here.
    # For example, check a timestamp in session or use Rails' built-in session expiration.
    false
  end

  def log_session_id
    Rails.logger.info "Session ID: #{session.id.to_s}"
  end

  public

  def cleanup_user
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      user.destroy if user
      session[:user_id] = nil
    end
    head :ok
  end
end

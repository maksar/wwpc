class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  check_authorization :unless => :do_not_check_authorization?

  def self.maps
    [
      "Badlands",
      "Arctic Refuge",
      "Canis River",
      "Cobalt Valley",
      "Crimson Feud",
      "Emerald Crater",
      "Eye of the Storm",
      "Fields of Isis",
      "Finn's Revenge",
      "Loki",
      "Niflheim Final II",
      "Open Palms",
      "Open Waters",
      "Point of Reach",
      "Regor Vi Highlands",
      "Roanoke Abyss",
      "Saltrock Colony",
      "Standing Stones",
      "Syrtis Major",
      "Theta Passage",
      "Twin Rivers",
      "Vya-3 Protectorate",
      "White Fire"
    ]
  end

  private

  # controller cancan does not authorize
  def do_not_check_authorization?
    respond_to?(:devise_controller?) ||
    respond_to?(:home_controller?)
  end

  protected

  def configure_permitted_parameter
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end

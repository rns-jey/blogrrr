class ApplicationController < ActionController::API
  protect_from_forgery with: :null_session
  respond_to :json
  before_action :underscore_params!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def underscore_params!
    params.deep_transform_keys!(&:underscore)
  end

  private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end

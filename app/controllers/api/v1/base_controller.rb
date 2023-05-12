class Api::V1::BaseController < ActionController::API

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = ::JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def ok(message)
    render_successs(message: message, status: :ok)
  end

  def created(message, data)
    render_successs(message: message, status: :created, data: data)
  end

  def render_successs(status: :ok, message: nil, data: nil)
    status_code = Rack::Utils::SYMBOL_TO_STATUS_CODE[status]
    if data.present?
      render json: { success: true, status: status_code, message: message, data: data }, status: status
    else
      render json: { success: true, status: status_code, message: message }, status: status
    end
  end

  def unauthorized(message)
    render_failure(message: message, status: :unauthorized)
  end

  def unprocessable_entity(message)
    render_failure(message: message, status: :unprocessable_entity)
  end

  def bad_request(message)
    render_failure(message: message, status: :bad_request)
  end

  def not_found(message)
    render_failure(message: message, status: :not_found)
  end

  def not_acceptable(message)
    render_failure(message: message, status: :not_acceptable)
  end

  def forbidden(message)
    render_failure(message: message, status: :forbidden)
  end

  def render_failure(status:, message:)
    status_code = Rack::Utils::SYMBOL_TO_STATUS_CODE[status]
    render json: { success: false, status: status_code, message: message }, status: status
  end

end

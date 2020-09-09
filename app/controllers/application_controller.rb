class ApplicationController < ActionController::Base
  rescue_from ActionController::UnpermittedParameters, with: :invalid_field_handler
  before_filter :load_object, except: [:create, :index]
  before_filter :validate_params, except: [:index, :show]
  # protect_from_forgery  with: :null_session

  def index
    load_objects
  end

  def load_object(items = scoper)
    # @item = items.where(params[:id]).first
    # log_and_render_404 unless @item
  end

  def load_objects(items = scoper, paginate = true)
    @items_count = items.count
    @items = items
  end

  def log_and_render_404
    Rails.logger.debug "API V2 Item not present. Id: #{params[:id]}, method: #{params[:action]}, controller: #{params[:controller]}"
    head 404
  end

  def scoper
    #override it
  end

  def invalid_field_handler(exception)
    invalid_params = exception.params.join(', ')
    render json: { status: "invalid_params_in_request", message: "invalid params are present in request: " + invalid_params }, status: 400
  end

  def cname
    controller_name.singularize
  end

  def params_for_validation_from_request_body
    cname_param = controller_name.singularize
    params_for_validation = params.except(cname_param)
  end

  def record_not_found
    head 404
  end

  def render_errors(item)
   render json: { error_data: item.errors.messages, status: 400 }, status: 400
  end
end

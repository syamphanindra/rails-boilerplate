class UsersController < ApplicationController
  include UserConstants
  # extend ActiveSupport::Concern
  def index
    @users = User.all
    # render :json => {:name => "David"}.to_json
  end

  def show
    @user = User.find_by_id(params["id"])
  end

  def create
    # byebug
    @user = User.new(params[cname])
    user_delegator = UserDelegator.new(@user)
    unless user_delegator.valid?(params[:action])
      render_errors(user_delegator) && return
    end
    unless @user.save
      render_errors(@user)
    end
  end

  private

    def scoper
      User.all
    end

    def validate_params
      allowed_fields = "#{constants_class}::#{action_name.upcase}_FIELDS".constantize
      permit = params_for_validation_from_request_body.permit(*allowed_fields)
      user = UserValidation.new(params_for_validation_from_request_body, @item)
      isvalid = user.valid?(params[:action])
      render_errors(user) unless isvalid
      isvalid
    end

    def constants_class
      :UserConstants.to_s.freeze
    end

    def load_object
      @item = User.find_by_id(params["id"])
      record_not_found if @item.nil?
    end
end
# https://rubyinrails.com/2018/11/10/rails-building-json-api-resopnses-with-jbuilder/

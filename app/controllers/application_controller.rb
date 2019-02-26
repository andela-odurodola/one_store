class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  before_action :authorize_request

  attr_reader :current_user

  private

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  def is_admin?
    # @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    raise(ExceptionHandler::AuthenticationError) unless current_user.admin?
  end
end

class ApplicationController < ActionController::Base
  before_action :authenticate_or_token
  check_authorization unless: :devise_controller?


  private
  def authenticate_or_token
    if request.headers["AUTH-TOKEN"] == ENV['DEVISE_SECRET_KEY'] || 'xyz'
      @current_user =  User.create(email: 'reader@mail.de', password: 'geheim12', password_confirmation: 'geheim12', approved: true, confirmed_at: DateTime.now, role: :reader)
      return current_user
    end
    authenticate_user!
  end
end

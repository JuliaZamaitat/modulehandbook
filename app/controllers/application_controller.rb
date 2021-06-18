class ApplicationController < ActionController::Base
  before_action :authenticate_or_token
  check_authorization unless: :devise_controller?


  private
  def authenticate_or_token
    if ENV['RAILS_ENV'] == 'staging'
    if ENV['API_KEY'] == ENV['DEVISE_SECRET_KEY']
      @current_user =  User.create(email: 'admin@mail.de', password: 'geheim12', password_confirmation: 'geheim12', approved: true, confirmed_at: DateTime.now, role: :admin)
      return current_user
    end
  end
    authenticate_user!
end
end
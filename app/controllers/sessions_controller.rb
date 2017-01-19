class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']

    @authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])
    if @authorization
      # byebug
      session[:user_id] = @authorization.id
      redirect_to root_path
    else
      user = User.new name: auth_hash[:info][:name],
                      email: auth_hash[:info][:email]
      user.authorizations.build provider: auth_hash["provider"],
                                uid: auth_hash[:uid]
      user.save
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path, notice: "Something went wrong, did you allow access to our app?"
  end

  def destroy
    session.destroy
    redirect_to root_path, notice: "You successfully logged out"
  end
end

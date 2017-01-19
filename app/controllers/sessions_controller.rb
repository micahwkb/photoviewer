class SessionsController < ApplicationController

  def new

  end

  def create
    # byebug
    auth_hash = request.env['omniauth.auth']
    # render json: auth_hash

    @authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])
    if @authorization
      render text: "Welcome back #{@authorization.user.name}!"
    else
      user = User.new name: auth_hash[:info][:name],
                      email: auth_hash[:info][:email]
      user.authorizations.build provider: auth_hash["provider"],
                                uid: auth_hash[:uid]
      user.save
    end

    redirect_to root_path
  end

  def failure
  end

  protected

  def auth_hash

  end
end

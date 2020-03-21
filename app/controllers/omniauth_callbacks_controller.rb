class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    service = Service.where(provider: auth.provider, uid: auth.uid).first

    if service.present?
      user = service.user
    else
      user = User.create!(
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
        )
      user.services.create(
        provider: auth.provider,
        uid: auth.uid,
        # expires_at: Time.at(auth.credentials.expires_at),
        access_token: auth.credentials.token,
        access_token_secret: auth.credentials.token_secret
      )
    end

  sign_in_and_redirect user, event: :authentication
  set_flash_message :notice, :success, kind: "Github"

  end

  def auth
    request.env['omniauth.auth']
  end
end

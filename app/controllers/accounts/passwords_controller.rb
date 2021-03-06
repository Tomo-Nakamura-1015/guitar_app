class Accounts::PasswordsController < ApplicationController
  before_action :authenticate_user!
 
    def edit
    end
 
    def update
      if current_user.update_with_password(password_params)
        sign_in(current_user, bypass: true)
        flash[:notice] = "パスワードを変更しました"
        redirect_to account_path
      else
        flash[:error] = "もう一度やりなおしてください"
        render :edit
      end
    end
 
    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation, :current_password)
    end

end

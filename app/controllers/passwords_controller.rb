class PasswordsController < ApplicationController
  def new
    # Render reset password form
  end

  def create
    user = User.find_by_email(params[:email])

    if user
      # start password flow
      user.set_password_reset
      UserMailer.password_reset(user).deliver

    end

    # render text: "User has been reset"
    redirect_to login_url, notice: "Email was sent with instructions"

  end

  def edit
    code = params[:id]
    @user = User.find_by(code: code)
    puts "THIS IS USER \n \n \n \n \n"
    puts user
  end

  def update
    code = params[:id]
    @user = User.find_by(code: code)
    if @user.update_attributes param.require(:user).permit(:password, :password_confirmation)
      #invalidate the @user.code to avoid replay
      @user.code = nil
      @user.save
      redirect_to root_path
    else
      redirect_to "/passwords/#{@user.code}"
    end
  end
  

end

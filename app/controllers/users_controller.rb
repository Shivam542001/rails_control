class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  http_basic_authenticate_with name: "aa", password: "aa"

  def index
    # render file: "#{Rails.root}/public/500.html", layout: false
    @users = User.all
    # render layout: "special"
  end
  
  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    # session[:name] = 'session!!!!!!!!!!!!!!!'
    # cookies[:name] = 'cookies!!!!!!!!!!!!!!!'
    # flash[:notice] = "You have successfully logged out."

    @user = User.new(user_params)

      if @user.save
        # CrudNotificationMailer.create_notification(@user).deliver_now
        # SendEmailsJob.perform_now(@user)
        # SendEmailsJob.set(wait_until: Time.now+10).perform_later(@user)
        redirect_to @user
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @user.update(user_params)
        CrudNotificationMailer.update_notification(@user).deliver_now
        redirect_to @user
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    CrudNotificationMailer.delete_notification(@user).deliver_now
    @user.destroy
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :age, :address)
    end
end

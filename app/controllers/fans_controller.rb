class FansController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :new, :create, :show]
  before_action :set_fan, only: [:show, :edit, :update, :destroy]

  def index
    @fans = Fan.all
  end

  def show
    @fan = Fan.find(params[:id])
  end

  def new
    @fan = Fan.new
    @fan.build_user
  end

  def edit
    @user = current_user
    @fan = Fan.find(params[:id])
  end

  def create
    @fan = Fan.new(fan_params)
      if @fan.save
        sign_in @fan.user 
        flash[:success] = "Your fan profile has been successfully created...Please complete the rest of your profile"
        redirect_to @fan
      else
        render :new
      end
  end

  def update
    @fan = Fan.find(params[:id])
      if @fan.update_attributes(fan_params)
        flash[:success] = "Profile updated"
        redirect_to @fan
      else
        render :edit
      end
  end

  def destroy
    @fan.destroy
    sign_out :user 
    flash[:alert] = "Your account was successfully deleted, goodbye."
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fan
      @fan = Fan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fan_params
      params.require(:fan).permit(:first_name, :last_name, :fan_name, :city, :country, :bio, :avatar, user_attributes: [ :id, :email, :user_name, :password ])
    end
end

class ArtistsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :new, :create, :show]
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @tracks = @artist.tracks.all
  end

  def new
    @artist = Artist.new
    @artist.build_user
  end

  def edit
    @user = current_user
    @artist = Artist.find(params[:id])  
    redirect_to root_url unless current_user[:account_id] == @artist.id
  end

  def create
    @artist = Artist.new(artist_params)
      if @artist.save
        sign_in @artist.user
        flash[:success] = "Artist profile created! Please complete the rest of your profile." 
        redirect_to @artist
      else
        render :new 
      end
  end

  def update
    @artist = Artist.find(params[:id])
      if @artist.update_attributes(artist_params)
        flash[:success] = "Profile updated"
        redirect_to @artist
      else
        render :edit 
      end
  end

  def destroy
    @artist.destroy
      sign_out :user
      flash[:alert] = "Your account was successfully deleted, goodbye."
      redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:artist_name, :first_name, :last_name, :country, :genre, :avatar, user_attributes: [ :id, :email, :user_name, :password ])
    end
end

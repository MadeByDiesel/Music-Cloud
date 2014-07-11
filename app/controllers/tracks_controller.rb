class TracksController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = Track.all
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
 
  end

  # GET /tracks/new
  def new
    @artist = Artist.find(params[:artist_id])
    @track = @artist.tracks.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    #@track = Track.new(track_params)
    @artist = Artist.find(params[:artist_id])
    @track = @artist.tracks.create(track_params)
      if @track.save
        flash[:notice] = "Track was successfully created."
        redirect_to @artist # this works: artist_path(current_user) @artist doesn't = nil
      else
        render :new
      end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
      flash[:alert] = "Track was successfully deleted."
      redirect_to artist_path(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:track_title, :description, :track_type, :avatar, :audio)
    end
end
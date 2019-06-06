class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  #before_action :set_users, only: [:new, :edit, :create, :update]

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = Playlist.all
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    #8.2
    @song = Song.new
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
    # 4
    @users_array = User.all.map{|x| [x.name, x.id]} ##

  end

  # GET /playlists/1/edit
  def edit
    @users_array = User.all.map{|x| [x.name, x.id]} ##
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)
    @users_array = User.all.map{|x| [x.name, x.id]} ##

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        # incluir variable de instancia con los datos de nombre e id, sino pasa de largo y muestra new
        @users_array = User.all.map{|x| [x.name, x.id]}
        format.html { render :new } #llega aca y muestra la vista del new, sin llamar al metodo
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    @users_array = User.all.map{|x| [x.name, x.id]} ##
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:name, :user_id)
    end

## def set_users
##    @users_array = User.all.map{|x| [x.name, x.id]}
## end

## con el before_action de arriba usa este metodo y lo usa en los metodos new, edit, create, update

end

class SongsController < ApplicationController
# 8.3
    def create
        @song = Song.new(song_params) # lo crea y lo deja nil
        @song.playlist = Playlist.find(params[:playlist_id]) # le asigna
        @song.save
        @playlist = @song.playlist
        if @song.save
            redirect_to playlist_path(@song.playlist), notice: 'la cancion se ha creado con exito'
        else
            render 'playlists/show' #renderea a esa vista
        end
    end
#11
    def destroy
        song = Song.find(params[:id])
        song.destroy
        #redirecciona a la playlist
        # 12
        redirect_to playlist_path(song.playlist), notice: 'la cancion se ha eliminado con exito' 
    end


    private
    def song_params
        params.require(:song).permit(:name, :artist)
    end

end

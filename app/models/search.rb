# Generates array of Spotify tracks based on valid
# keyword using rspotify gem
class Search < ActiveRecord::Base
    before_create :set_counter

    validates :keyword, presence: true
    validates :keyword, length: { minimum: 2}

    # Returns an array of tracks for given (valid) keyword
    def get_tracks!
        tracks = RSpotify::Track.search(self.keyword, limit: 50, offset: 0).sort_by(&:popularity)

        tracks.delete_if { |t| t.popularity < 45 }
        tracks = tracks.uniq { |t| t.artists.first.name }        

        raise 'The playlist could not be generated' if tracks.size < 4
        return tracks.reverse
    end

    # Create or re-create a Spotify playlist based upon tracks from a conducted search
    def get_playlist!(user, playlist_title)
        playlist = user.playlists.select { |p| p.name == playlist_title}      
        tracks = self.get_tracks!

        if playlist.empty?
            # Let's make a new playlist then!
            playlist = user.create_playlist!(playlist_title)            
            playlist.add_tracks!(tracks)  
        else
            # Pre-existing playlist
            # @todo This is pretty damn ugly!
            id = playlist.map { |p| p.id  }            
            playlist = RSpotify::Playlist.find(user.id, id.first)
            tracks = tracks & playlist.tracks
            playlist.add_tracks!(tracks) unless tracks.empty?
        end

        return playlist.uri
    end

    # @todo Do we really need this?
    def set_counter
        self.count = 1
    end
end

class Search < ActiveRecord::Base
    before_create :set_counter

    validates :keyword, presence: true
    validates :keyword, length: { minimum: 2}

    def get_tracks!
        tracks = []

        search_result = RSpotify::Track.search(self.keyword, limit: 50, offset: 0).sort_by(&:popularity)

        search_result.each do |track|
            tracks << track unless track.popularity < 50
        end

        if tracks.size < 5
            raise 'The playlist could not be generated'
        end

        # Update counter for search term
        #self.count.increment

        return tracks.reverse
    end

    def set_counter
        self.count = 1
    end
end

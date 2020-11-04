class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
    
    def new_song(name, genre)  # given th name an genre, creates new song associated wit artist
        Song.new(name, self, genre)
    end

    def songs  # returns songs associated wit said artist
        Song.all.select { |song| song.artist == self }
    end

    def genres  # has many genres, through songs 
        songs.map(&:genre)
    end

end

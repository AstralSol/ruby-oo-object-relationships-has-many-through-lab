class Genre
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs  # has many songs 
        Song.all { |song| song.genre == self }
    end

    def artists   # has many artists, through songs
        songs.map(&:artist)
    end

    def add_song(song) 
        songs << song
    end
end
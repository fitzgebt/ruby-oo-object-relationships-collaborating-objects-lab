require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []
    
    def initialize(name)
        @name=name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name
        self.artist != nil ? self.artist.name : nil
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        self.artist=artist  
    end

    def self.new_by_filename(filename)
        song = filename.split(" - ")[1]
        song = self.new(song)
        song.artist_name = filename.split(" - ")[0]
        song
    end
end

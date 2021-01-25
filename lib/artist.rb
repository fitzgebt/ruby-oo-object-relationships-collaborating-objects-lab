require 'pry'

class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @@all << self
        @name=name
        
    end
    
    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        if @@all.find {|artist| artist.name == name}
            @@all.find {|artist| artist.name == name}
        else 
            artist = Artist.new(name)
        end
    end

    def print_songs
        x = Song.all.select {|song| song.artist == self}
        x.each {|song| puts  song.name}
    end
    
    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song_by_name(name)
        song = Song.new(name)
        song.artist = self
    end

    def self.song_count
        Song.all.count
    end
  
end
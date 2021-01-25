require 'pry'

class MP3Importer
    attr_accessor :path

    @@all = []

    def initialize(path)
        @path=path
        files
    end

    def files
        clean_files = []
        x = Dir.entries(path)
        x.reject{|x| x == "." || x == ".."}.each do |file|
            clean_files << file
        end
        clean_files
    end
    def import
        files.each {|filename| Song.new_by_filename(filename)}
    end
end
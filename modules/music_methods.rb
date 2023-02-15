require_relative '../music_album'
require_relative '../genre'
require 'json'

module MusicMethods
    MUSIC_ALBUM_FILE = './store/music_album.json'.freeze
    GENRE_FILE = './store/genre.json'.freeze

    @@music_album_arr = File.empty?(MUSIC_ALBUM_FILE) ? [] : JSON.parse(File.read(MUSIC_ALBUM_FILE))
    @@genre_arr = []


    def add_music_album
        print 'Enter Album name: '
        name = gets.chomp

        print 'Enter artist name: '
        artist = gets.chomp

        print 'Enter publish date [YYYY-MM-DD]: '
        publish_date = gets.chomp

        print 'Enter genre: '
        genre = gets.chomp

        print 'Is it on shopify [y/n]: '
        on_spotify = gets.chomp

        Genre.new(genre)
        MusicAlbum.new(name, artist, genre, publish_date, on_spotify == 'y')

        preserve_music_date(name, artist, genre, publish_date, on_spotify == 'y')

        puts 'Music Album Created Successfuly'
    end

    def preserve_music_date(name, artist, genre, publish_date, on_spotify)
        @@genre_arr.push(genre)

        @@music_album_arr.push({
            name: name,
            artist: artist,
            genre: genre,
            publish_date: publish_date,
            on_spotify: on_spotify,
        })

        File.write(MUSIC_ALBUM_FILE, JSON.generate(@@music_album_arr))
    end

    # def fetch_preserved_data
    #     if(File.exists?(MUSIC_ALBUM_FILE) && File.empty?(MUSIC_ALBUM_FILE) != true )
    #         JSON.parse(File.read(MUSIC_ALBUM_FILE))
    #     else
    #         return []
    #     end
    # end

end
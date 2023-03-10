require_relative './modules/book_module'
require_relative './modules/label_module'
require_relative './modules/music_methods'
require_relative './modules/game_methods'

class App
  include MusicMethods
  include BookModule
  include LabelModule
  include GameMethods

  attr_reader :options

  def initialize
    @options = {
      '1': method(:list_all_books),
      '2': method(:list_all_music_albums),
      '3': method(:list_all_games),
      '4': method(:list_all_genres),
      '5': method(:list_all_labels),
      '6': method(:list_all_authors),
      '7': method(:add_book),
      '8': method(:add_music_album),
      '9': method(:add_game),
      '10': method(:exit)
    }

    @music_album_arr = File.exist?(MUSIC_ALBUM_FILE) ? JSON.parse(File.read(MUSIC_ALBUM_FILE)) : []
    @genre_arr = File.exist?(GENRE_FILE) ? JSON.parse(File.read(GENRE_FILE)) : []

    @game = File.exist?(GAME_FILE) ? JSON.parse(File.read(GAME_FILE)) : []
    @author = File.exist?(AUTHOR_FILE) ? JSON.parse(File.read(AUTHOR_FILE)) : []
  end

  def ask_question(question)
    print question
    gets.chomp
  end
end

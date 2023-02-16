require_relative '../game'
require_relative '../author'
require 'json'

module GameMethods
  GAME_FILE = './store/game.json'.freeze
  AUTHOR_FILE = './store/author.json'.freeze

  def add_game
    print 'Enter Multiplayer Type: '
    multiplayer = gets.chomp

    print 'Enter Last Played Date [YYYY-MM-DD]:'
    last_played_at = gets.chomp

    print 'Enter Publish Date [YYYY-MM-DD]:'
    publish_date = gets.chomp

    print 'Enter First Name:'
    first_name = gets.chomp

    print 'Enter Last Name:'
    last_name = gets.chomp

    Author.new(first_name, last_name)
    Game.new(multiplayer, last_played_at, publish_date, first_name, last_name)

    preserve_games_data(multiplayer, last_played_at, publish_date, first_name, last_name)

    puts 'Games File Created Successfully'
  end

  def preserve_games_data(multiplayer, last_played_at, publish_date, first_name, last_name)
    @games = File.exist?(GAME_FILE) ? JSON.parse(File.read(GAME_FILE)) : []
    @authors = File.exist?(AUTHOR_FILE) ? JSON.parse(File.read(AUTHOR_FILE)) : []

    @games.push({
                  multiplayer: multiplayer,
                  last_played_at: last_played_at,
                  publish_date: publish_date,
                  first_name: first_name,
                  last_name: last_name
                })

    @authors.push({ first_name: first_name, last_name: last_name })

    File.write(GAME_FILE, JSON.generate(@games))
    File.write(AUTHOR_FILE, JSON.generate(@authors))
  end

  def list_all_games
    @games = File.empty?(GAME_FILE) ? [] : JSON.parse(File.read(GAME_FILE))
    if File.empty?(GAME_FILE)
      puts 'No Data Inside game.json!'
    else
      @games.each_with_index do |item, id|
        index = id + 1
        puts "#{index} - Multiplayer: #{item['multiplayer']} - Last Played At: #{item['last_played_at']}\
        - Publish Date: #{item['publish_date']} -  First Name: #{item['first_name']}\
        - Last Name: #{item['last_name']}  "
      end
    end
  end

  def list_all_authors
    @authors = File.empty?(AUTHOR_FILE) ? [] : JSON.parse(File.read(AUTHOR_FILE))
    if File.empty?(AUTHOR_FILE)
      puts 'No Data Inside author.json!'
    else
      @authors.each_with_index do |item, id|
        index = id + 1
        puts "#{index} - First Name: #{item['first_name']} - Last Name: #{item['last_name']}"
      end
    end
  end
end

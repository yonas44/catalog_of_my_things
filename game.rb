require_relative 'item.rb'

class Game < Item 
    attr_accessor :multiplayer, :last_played_at
    def initialize(multiplayer, last_played_at)
        super()
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end
end
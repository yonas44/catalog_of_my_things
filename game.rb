require_relative 'item'
require 'date'

require_relative 'author'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    cur_date = Date.today
    last_played_date = Date.parse(@last_played_at)
    req_date = ((cur_date - last_played_date) / 365).floor > 2
    super && req_date
  end
end

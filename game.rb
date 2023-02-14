require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    cur_date = Date.today
    pub_date = Date.parse(@publish_date)
    req_date = ((cur_date - pub_date) / 365).floor > 2
    super && req_date
  end
end

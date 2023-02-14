require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    Item.can_be_archived? && @on_spotify ? true :
  end
end

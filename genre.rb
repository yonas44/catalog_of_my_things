class Genre
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..100_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end

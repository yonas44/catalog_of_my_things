class Genre
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..100_000)
    @name = name
    @items = []
  end
end

class Author
  attr_accessor :first_name, last_name, items
  attr_reader :id

  def initialize(first_name, last_name)
    @id = Random.rand(1..10_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end
end

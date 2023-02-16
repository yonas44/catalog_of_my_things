require_relative './item'

class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title, color)
    @id = Random.rand(1..10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = title
  end

  def to_json(*_args)
    {
      title: @title,
      color: @color,
      items: @items
    }
  end
end

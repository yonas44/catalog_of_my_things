class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date, archived)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_label(label)
    @label = label
    label.items << self
  end

  # Adds the relation between Item and Author classes so that we can pass author as an object inside item
  def add_author(author)
    @author = author
    author.items << self
  end
end

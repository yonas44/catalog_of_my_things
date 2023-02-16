require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
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

  def can_be_archived?
    cur_date = Date.today
    pub_date = Date.parse(@publish_date)

    ((cur_date - pub_date) / 365).floor > 10
  end
end

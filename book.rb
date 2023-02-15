require_relative './item'
require_relative './book_module'

class Book < Item
  attr_accessor :publisher, :cover_state
  include BookModule

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def test_fn
    store_book(@publisher, @cover_state, @publish_date)
  end
end

book = Book.new('yonas', 'good', '2023-02-02').list_books

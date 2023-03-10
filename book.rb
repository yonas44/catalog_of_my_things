require_relative './item'
require_relative './modules/book_module'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*_args)
    {
      publisher: @publisher,
      cover_state: @cover_state,
      publish_date: @publish_date,
      label: label
    }
  end
end

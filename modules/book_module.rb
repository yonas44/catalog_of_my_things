require_relative '../book'
require_relative '../label'
require 'json'

module BookModule
  def fetch_books
    File.open('./store/books.json', 'r') { |line| JSON.parse(line.read) }
  end

  def add_book
    publisher = ask_question('Name of the publisher: ')
    cover_state = ask_question('Cover_state(hint: bad/good): ') until %w[bad good].include?(cover_state)
    publish_date = ask_question('Publish_date(yyyy/dd/mm): ')
    book = Book.new(publisher, cover_state, publish_date)
    add_label(book)
    store_book(book)
    puts 'Book created successfully'
  end

  def store_book(book)
    books = fetch_books
    books << book.to_json
    File.write('./store/books.json', JSON.generate(books), mode: 'w')
  end

  def list_all_books
    books = fetch_books
    return puts 'There are no books stored!' if books.empty?

    books.each do |book|
      puts "Publisher: #{book['publisher']}, Cover_state: #{book['cover_state']}, Publish_date: #{book['publish_date']}"
    end
  end
end

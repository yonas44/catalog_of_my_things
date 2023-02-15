require 'json'

module BookModule
    def fetch_books
        File.open('./store/books.json', 'r') { |line| JSON.parse(line.read) }
    end

    def store_book(publisher, cover_state, publish_date)
        books = fetch_books
        books << { 
            publisher: publisher, 
            cover_state: cover_state, 
            publish_date: publish_date
        }
        File.write('./store/books.json', JSON.generate(books), mode: 'w')
    end
    
    def list_books
        books = fetch_books
        books.each { |book|
            Book.new(book["publisher"], book["cover_state"], book["publish_date"])
            puts "Publisher: #{book["publisher"]}, Cover_state: #{book["cover_state"]}, Publish_date: #{book["publish_date"]}"
        }
    end
    
end

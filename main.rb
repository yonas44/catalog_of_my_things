require_relative 'app'

def main
  puts 'Welcome to Catalog of my things!'
  app = App.new

  loop do
    puts [' ', 'Please, choose an option by entering a number:',
          '1. List all books', '2. List all music albums', '3. List all games',
          '4. List all genres', '5. List all labels',
          '6. List all authors', '7. Add a book',
          '8. Add a music album',
          '9. Add a game',
          '10. Exit']

    num = gets.chomp

    if num == '10'
      puts 'Thank you for using our App!'
      break
    elsif (1...10).include?(num.to_i)
      app.options[:"#{num}"].call
    else
      puts 'Please enter a valid input; Hint: try (1...10)'
    end
  end
end

main

require 'pry'
require_relative './book'
require_relative './author'

fred = Author.new("Fred")
tom = Author.new("Tom")
bill = Author.new("Bill")
tom.write_book("The Story", 200)
tom.write_book("The Other Story",350)
fred.write_book("A Better Story",250)
fred.write_book("The Best Story",200)
bill.write_book("Competition for Chumps",700)
story = Book.find_or_create_by_title("The story")



binding.pry

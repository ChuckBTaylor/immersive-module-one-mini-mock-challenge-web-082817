class Author

  ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    # @books = []
    ALL << self
  end

  def write_book(title, word_count)
    new_book = Book.new(title, self, word_count)
    # @books << new_book
  end

  def write_book_input
    puts "What's the title?"
    new_title = gets.chomp
    puts "How many words?"
    word_count = gets.chomp.to_i
    new_book = Book.new(new_title, self, word_count)
    # @books << new_book
  end

  def book_titles
    self.books_ssot.each do |book|
      puts book.title
    end
  end

  def total_words
    self.books_ssot.map do |book|
      book.word_count
    end.reduce do |sum, words|
      sum + words
    end
  end

  def self.most_words
    most = Author.all.sort do |a,b|
      b.total_words <=> a.total_words
    end.first
    puts "#{most.total_words}"
    most
  end

  def books_ssot
    Book.all.select do |book|
      book.author == self
    end
  end
  #
  # def update
  #   @books = []
  #   @books = Book.all.select do |book|
  #     book.author == self
  #   end
  # end

  def books
    self.books_ssot
  end

  def self.all
    ALL
  end



end

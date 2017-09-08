class Book

  ALL = []
  attr_reader :title, :word_count
  attr_accessor :author

  def initialize(title, author, word_count = 500)
    @title = title
    @author = find_author_by_name(author)
    @word_count = word_count
    ALL << self
  end

  def self.all
    ALL
  end

  def author_books
    self.class.all.select do |book|
      book.author == self.author
    end
  end


  def find_author_by_name(author_to_find)
    unless author_to_find.is_a?(Author)
      author_to_find = Author.all.find do |author|
        author.name.downcase == author_to_find.downcase
      end
    end
    author_to_find
  end

  def self.find_or_create_by_title(title)
    new_book = Book.all.find do |book|
      book.title.downcase == title.downcase
    end
    unless new_book
      new_book = Book.new(title, "Unknown")
      self.all << new_book
    end
    new_book
  end


end

class Counter < Thor
  desc "one", "Prints 1, 2, 3"
  def one
    puts 1
    invoke :two
    invoke :three
  end

  desc "two", "Prints 2, 3"
  def two
    puts 2
    invoke :three
  end

  desc "three", "Prints 3"
  def three
    puts 3
  end
end

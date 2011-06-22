class Group < Thor::Group
  # number will be available as attr_accessor
  argument :number, :type => :numeric, :desc => "The number to start counting"
  desc "Prints the 'number' given upto 'number+2'"

  def one
    puts number + 0
  end

  def two
    puts number + 1
  end

  def three
    puts number + 2
  end
end

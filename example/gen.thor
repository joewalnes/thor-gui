class Gen < Thor::Group
  include Thor::Actions

  def test
    if yes?("Create test file")
      create_file "tmpfile.txt"
    else
      say "awww", :red
    end
  end
end

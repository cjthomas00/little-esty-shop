class Commits 
  attr_reader :commit, :author
  
  def initialize(data)
    @commit = data[:commit]
    @author = @commit[:author][:name]
  end
end
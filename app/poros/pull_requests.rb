class PullRequests 
  attr_reader :pull
  
  def initialize(data)
    @pull = data[:number]
  end

end
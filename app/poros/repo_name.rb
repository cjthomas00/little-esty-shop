class RepoName 
  attr_reader :name,
              :id,
              :node_id

  def initialize(data)
    require 'pry'; binding.pry #<=== code breaks here.
    @name = data[:name]
  end
end
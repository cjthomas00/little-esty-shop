class UserName
  attr_reader :user_names
  
  def initialize(data)
    @user_names = data[:login]
  end
end
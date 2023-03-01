require './app/services/github_repo_service'
require './app/poros/user_names'


class UserNamesSearch  
  def user_name_information  
    service.user_names.map do |data|
      UserName.new(data)
    end
  end

  def service
   GithubRepoService.new 
  end
end
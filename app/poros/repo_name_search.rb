require './app/services/github_repo_service'
require './app/poros/repo_name'


class RepoNameSearch  
  def repo_name_information  
    RepoName.new(service.repo_name)
  end

  def service
   GithubRepoService.new 
  end
end
require './app/services/github_repo_service'
require './app/poros/repo_name'


class RepoNameSearch  
  def repo_name_information  
    service.repo_name.map do |data|
    RepoName.new(data)
    end
  end

  def service
   GithubRepoService.new 
  end
end
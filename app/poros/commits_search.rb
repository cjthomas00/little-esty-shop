require './app/services/github_repo_service'
require './app/poros/commits'


class CommitsSearch  
  def commit_information  
    service.commits.map do |data|
      Commits.new(data)
    end
  end

  def service
   GithubRepoService.new 
  end
end
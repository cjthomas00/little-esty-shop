require './app/services/github_repo_service'
require './app/poros/pull_requests'

class PullRequestsSearch  
  def pull_request_information  
    service.pull_requests.map do |data|
      PullRequests.new(data)
    end
  end

  def service
   GithubRepoService.new 
  end
end
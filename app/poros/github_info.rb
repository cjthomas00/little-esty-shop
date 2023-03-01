require './app/poros/repo_name_search'
require './app/poros/commits_search'
require './app/poros/user_names_search'
require './app/poros/pull_requests_search'
require 'pry'

class GithubInfo
  attr_reader :repo_name, :user_names, :pull_requests, :commits
  
  def initialize
    @commits = get_commits
    @repo_name = RepoNameSearch.new.repo_name_information.name
    @user_names = UserNamesSearch.new.user_name_information
    @pull_requests = PullRequestsSearch.new.pull_request_information.first.pull
  end 

   def get_commits
    commits = CommitsSearch.new.commit_information 

    authors = commits.map do |commit_obj| 
      commit_obj.author
    end

    grouped = authors.group_by do |author, commit| 
      author 
    end

    commits_per_author_hash = {}

    grouped.each do |key, value|
      commits_per_author_hash[key] = value.count
    end
    puts commits_per_author_hash
  end
end

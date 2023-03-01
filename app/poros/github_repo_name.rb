require './app/poros/repo_name_search'
require './app/poros/commits_search'

puts RepoNameSearch.new.repo_name_information.name


#===================== COMMITS ======================#
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
commits_per_author_hash
#===================== COMMITS ======================#


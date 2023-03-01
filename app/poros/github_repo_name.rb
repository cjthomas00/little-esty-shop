require './app/poros/repo_name_search'
require './app/poros/commits_search'
require './app/poros/user_names_search'

puts RepoNameSearch.new.repo_name_information.name

puts RepoNameSearch.new.repo_name_information.name
usernames = UserNamesSearch.new.user_name_information
  usernames.map do |data|  
    puts data.user_names
  end

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



 


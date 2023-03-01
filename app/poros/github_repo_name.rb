require 'pry'
require './app/poros/repo_name_search'
require './app/poros/user_names_search'

puts RepoNameSearch.new.repo_name_information.name
usernames = UserNamesSearch.new.user_name_information
  usernames.map do |data|  
    puts data.user_names
  end
 

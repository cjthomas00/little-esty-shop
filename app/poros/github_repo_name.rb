require 'pry'
require './app/poros/repo_name_search'

names = RepoNameSearch.new.repo_name_information

names.each do |name|
  puts name.name
end
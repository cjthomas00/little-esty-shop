require 'httparty'
require 'pry'

class GithubRepoService
  def repo_name
   get_url("https://api.github.com/repos/cjthomas00/little-esty-shop")
  end

  def user_names
    get_url("https://api.github.com/repos/cjthomas00/little-esty-shop/contributors")
  end

  def commits
    get_url("https://api.github.com/repos/cjthomas00/little-esty-shop/commits")
  end

  def pull_requests
    get_url("https://api.github.com/repos/cjthomas00/little-esty-shop/pulls") 
  end

  def get_url(url) # make a GET request
    # Talking to API
    response = HTTParty.get(url)
    data = response.body
    parsed = JSON.parse(data, symbolize_names: true) # ==> converts JSON to Ruby
  end
end
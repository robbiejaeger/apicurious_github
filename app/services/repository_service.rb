class RepositoryService

  def initialize
    @connection = Faraday.new("https://api.github.com")
  end

  def get_all_repos_for_user(current_user)
    @connection.headers["Authorization"] = "token #{current_user.oauth_token}"
    response = @connection.get("/users/#{current_user.login}/repos")
    parse(response)
  end

  def get_starred_repos(current_user)
    @connection.headers["Authorization"] = "token #{current_user.oauth_token}"
    response = @connection.get("/users/#{current_user.login}/starred")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
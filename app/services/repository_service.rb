class RepositoryService

  def initialize
    @connection = Faraday.new("https://api.github.com")
  end

  def setup_user_auth(user)
    @user = user
    @connection.headers["Authorization"] = "token #{@user.oauth_token}"
  end

  def get_all_repos_for_user(user)
    setup_user_auth(user)
    response = @connection.get("/users/#{user.login}/repos")
    parse(response)
  end

  def get_starred_repos(user)
    setup_user_auth(user)
    response = @connection.get("/users/#{user.login}/starred")
    parse(response)
  end

  def post_new_repo(params, user)
    response = @connection.post do |req|
      req.url '/user/repos'
      req.headers["Authorization"] = "token #{user.oauth_token}"
      params_hash = params.select {|key, value| ["name", "description"].include?(key) }
      req.body = params_hash.to_json
    end
  end

  def parse(response)
    JSON.parse(response.body)
  end
end

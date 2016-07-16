class ActivityService

  def initialize
    @connection = Faraday.new("https://api.github.com")
  end

  def setup_user_auth(user)
    @user = user
    @connection.headers["Authorization"] = "token #{@user.oauth_token}"
  end
  
  def get_user_activity(user)
    setup_user_auth(user)
    response = @connection.get("/users/#{user.login}/events")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end
end

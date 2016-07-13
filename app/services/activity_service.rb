class ActivityService

  def initialize
    @connection = Faraday.new("https://api.github.com")
  end

  def get_user_activity(current_user)
    @connection.headers["Authorization"] = "token #{current_user.oauth_token}"
    response = @connection.get("/users/#{current_user.login}/events")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end
end

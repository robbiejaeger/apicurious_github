class BasicInfoService

  def initialize
    @connection = Faraday.new("https://api.github.com")
  end

  def get_basic_info(current_user)
    @connection.headers["Authorization"] = "token #{current_user.oauth_token}"
    response = @connection.get("/users/#{current_user.login}")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end
end

class BasicInfoService

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com")
    @connection.headers["Authorization"] = "token #{@user.oauth_token}"
  end

  def get_basic_info
    response = @connection.get("/users/#{@user.login}")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end
end

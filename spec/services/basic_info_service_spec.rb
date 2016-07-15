require 'rails_helper'

describe BasicInfoService do
  context "#get_basic_info" do # pound sign used for instance method (. used for class method)
    it "returns basic info for a user." do
      VCR.use_cassette("basic_info") do
        user = User.new(
                        uid: ENV["user_uid"],
                        login: ENV["user_login"],
                        oauth_token: ENV["user_oauth_token"]
                        )

        basic_info = BasicInfoService.new(user).get_basic_info

        expect(basic_info["followers"]).to eq(4)
        expect(basic_info["following"]).to eq(0)
        expect(basic_info["company"]).to eq(nil)
      end
    end
  end
end

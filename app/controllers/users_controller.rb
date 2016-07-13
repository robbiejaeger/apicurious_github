class UsersController < ApplicationController

  def show
    @basic_info = BasicInfo.user_basic_info(current_user)
  end
end

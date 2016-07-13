class UsersController < ApplicationController

  def show
    @basic_info = BasicInfo.user_basic_info(current_user)
    @repos = Repository.user_repos_by_last_updated(current_user)
    @starred_repos = Repository.user_starred_repos(current_user)
  end
end

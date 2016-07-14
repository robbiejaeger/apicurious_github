class DashboardsController < ApplicationController

  def show
    @basic_info = BasicInfo.user_basic_info(current_user)
    @repos = Repository.user_repos_by_last_updated(current_user)[0..9]
    @starred_repos = Repository.user_starred_repos(current_user)
    @user_activity = Activity.user_activity(current_user)[0..5]
  end
end

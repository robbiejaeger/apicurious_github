class ReposController < ApplicationController

  def index
    @repos = Repository.user_repos_by_last_updated(current_user)
  end

  def new
  end

  def create
    Repository.create_repo(params, current_user)
    redirect_to dashboard_path
  end
end

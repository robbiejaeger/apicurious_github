class Repository < OpenStruct

  def self.service
    @@service ||= RepositoryService.new
  end

  def self.user_repos(current_user)
    user_repos_hash = service.get_all_repos_for_user(current_user)

    user_repos_hash.map do |repo_hash|
      Repository.new(repo_hash)
    end
  end

  def self.user_repos_by_last_updated(current_user)
    all_repos = user_repos(current_user)
    all_repos.sort_by {|repo| repo.updated_at}.reverse
  end

  def self.user_starred_repos(current_user)
    starred_repos_hash = service.get_starred_repos(current_user)

    starred_repos_hash.map do |repo_hash|
      Repository.new(repo_hash)
    end
  end
end

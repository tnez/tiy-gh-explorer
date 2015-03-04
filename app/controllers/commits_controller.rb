class CommitsController < ApplicationController
  def index
    @commits = Commit.order(commit_timestamp: :desc)
  end
end

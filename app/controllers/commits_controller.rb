class CommitsController < ApplicationController
  def index
    @commits = Commit.order(commit_timestamp: :desc)
  end

  def counts
    @counts = ActiveRecord::Base.connection.execute("SELECT student_id, count(id) AS commit_count FROM commits GROUP BY student_id;")
  end
end

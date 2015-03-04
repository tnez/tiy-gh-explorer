namespace :octokit do
  require 'Octokit'

  # authenticate so that we can be allowed more querries
  client = Octokit::Client.new(:netrc => true)
  client.login

  desc "Get new commit data for all of the students in our database"
  task :get_commits => :environment do
    # for each student in the database
    students = Student.all
    students.each do |student|
      # DEBUG: puts out student
      puts "Getting commits for #{ student.github_user }"
      # get the timestamp of the last commit in our database (or nil
      # if no commits were found)
      if (last_commit = student.commits.last)
        last_timestamp = last_commit.commit_timestamp
      else
        last_timestamp = "January 5th, 2015 12:00 AM EST".to_time
      end
      # ask github for all commits for this user after this last
      # timestamp and add them to our database... because the github
      # API uses pagination, we will need to step back through the
      # pages until we hit a commit that we have already seen, or we
      # have no more commits to check... GitHub pagination starts at 1
      pagination_idx = 1
      while pagination_idx <= 10
        events = client.user_public_events(student.github_user, {page:pagination_idx})
        # we have nothing to do if we have no events
        if events.empty?
          break
        end
        # otherwise, look at each event
        events.each do |event|
          # if the timestamp is not newer than our last timestamp,
          # then we can assume that we have no new information... thus
          # we can stop
          if event.created_at.to_time <= last_timestamp
            break
          end
          # otherwise, we need to process this only if it is a push
          # event
          if event.type === "PushEvent"
            # add the commit to our database
            commit_data = {}
            commit_data[:event_id] = event.id
            commit_data[:commit_timestamp] = event.created_at
            commit_data[:student_id] = student.id
            event.payload.commits.each do |commit|
              commit_data[:sha] = commit.sha
              commit_data[:message] = commit.message
              commit_data[:url] = commit.url
              Commit.create!(commit_data)
            end
          end
        end
        pagination_idx += 1
      end
    end
  end
end

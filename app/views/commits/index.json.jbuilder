json.array! @commits do |commit|
  json.studentId commit.student_id
  json.message commit.message
  json.sha commit.sha
  json.url commit.url
  json.timestamp commit.commit_timestamp
end

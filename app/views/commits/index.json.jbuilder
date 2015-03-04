json.array! @commits do |commit|
  json.studentId comment.student_id
  json.sha comment.sha
  json.url comment.url
  json.timestamp comment.commit_timestamp
end

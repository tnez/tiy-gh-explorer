json.array! @counts do |count_entry|
  json.studentId count_entry["student_id"]
  json.commitCount count_entry["commit_count"]
end

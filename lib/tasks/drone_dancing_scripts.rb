users_by_ip = User.all.sort_by &:last_sign_in_ip
previous_ip = 0
previous_time = 0
count = 0
users_by_ip.each do |user|
  ip = user.last_sign_in_ip
  time = Time.at(user.created_at).to_datetime
  if user.last_sign_in_ip == previous_ip
    if (time - previous_time).abs < 1200
      user.update(:uid => -1)
    end
  end
  previous_time = time
  previous_ip = ip
end


pros = Array.new
fakers = Array.new
Camp.all.each do |camp|
  user_id = camp.user_id
  user = User.find(user_id)
  pros.push(user)
  if user.uid == -1
    fakers.push(user)
  end
end


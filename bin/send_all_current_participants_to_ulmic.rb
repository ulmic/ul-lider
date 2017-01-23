User.where('created_at > ?', DateTime.new(2016, 12, 19)).each do |user|
  user_attributes = user.attributes
  [ 'created_at', 'updated_at', 'birth_date' ].each do |time_obj|
    user_attributes[time_obj] = user_attributes[time_obj].to_i
  end
  user_attributes['fields'] = {}
  user.fields.each_with_index do |field, index|
    user_attributes['fields'][index.to_s] = field.attributes.except('created_at', 'updated_at')
  end
  UlmicUserJob.perform_now user_attributes
  print "#{user.id} #{user.first_name} #{user.last_name}"
end

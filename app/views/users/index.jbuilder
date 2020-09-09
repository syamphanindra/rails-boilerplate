json.array! @users do |user|
  json.id user.id
  json.name user.full_name
  json.created_at user.created_at
end

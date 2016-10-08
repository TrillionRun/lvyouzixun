json.session do
  json.(@user, :id, :name, :role)
  json.token @user.authentication_token
end
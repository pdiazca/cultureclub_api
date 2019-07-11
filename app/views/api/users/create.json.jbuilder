json.user do
    json.call(
        @user,
        :id,
        :email,
        :is_admin,
        :authentication_token
    )
end

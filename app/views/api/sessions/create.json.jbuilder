json.user do
    json.call(
        @user,
        :email,
        :is_admin,
        :authentication_token
    )
end

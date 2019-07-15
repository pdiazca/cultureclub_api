json.user do
    json.call(
        @user,
        :id,
        :email,
        :is_admin,
    )

    if @raffles
        json.raffles do
            json.array! @raffles do |raffle|            
                json.call(
                    raffle,
                    :id,
                    :name
                )
            end
        end
    end
end

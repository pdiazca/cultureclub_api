json.raffle do
    json.id @raffle.id
    json.name @raffle.name
    json.description @raffle.description
    json.created_by @raffle.created_by
    json.created_at @raffle.created_at.to_formatted_s(:long)
    json.winner @raffle.winner
    json.contestants @raffle.users.count.to_s

    if @users
        json.users do
            json.array! @users do |user|            
                json.call(
                    user,
                    :id,
                    :email
                )
            end
        end
    end
end

json.raffle do          
    json.call(
        @raffle,
        :id,
        :name,
        :description,
        :created_by,
        :created_at,
        :winner
    )
    json.contestants @raffle.users.count.to_s
end

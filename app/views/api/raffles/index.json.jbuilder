json.raffle do
    json.array! @raffles do |raffle|            
    json.call(
        raffle,
        :id,
        :name,
        :description,
        :created_by,
        :created_at,
        :winner
    )
    json.contestants raffle.users.count.to_s
    end
end

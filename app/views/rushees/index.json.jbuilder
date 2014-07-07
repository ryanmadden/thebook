json.array!(@rushees) do |rushee|
  json.extract! rushee, :id, :name, :age, :bio
  json.url rushee_url(rushee, format: :json)
end

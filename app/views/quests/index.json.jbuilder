json.array!(@quests) do |quest|
  json.extract! quest, :question, :answer1, :answer2, :answer3, :answer4, :truequest
  json.url quest_url(quest, format: :json)
end

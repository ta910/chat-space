json.chats @chats do |chat|
  json.id       chat.id
  json.name     chat.user.name
  json.time     chat.time
  json.body     chat.body
  json.image    chat.image.to_s
end
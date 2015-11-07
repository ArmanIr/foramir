do

local function run(msg, matches)
  -- User submitted a user name
  if matches[1] == "username" then
   local user_name =  matches[2]
   user_ = string.gsub(user_name,"@","")  
  end

  -- The message must come from a chat group
  if msg.to.type == 'chat' then
    chat_id_ = 'chat#id'..msg.to.id
  chat_add_user(chat_id_, user_, ok_cb, false)
else 
    return 'This isnt a chat group!'
  end

end
return {
  description = "Invite other user to the chat group",
  usage = {
    "!invite name [user_name]", 
    "!invite id [user_id]" },
  patterns = {
    "^!invite (username) (.*)"
  }, 
  run = run 
}

end

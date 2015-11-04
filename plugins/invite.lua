-- Invite other user to the chat group.
-- Use !invite name User_name or !invite id id_number
-- The User_name is the print_name (there are no spaces but _)

do

local function run(msg, matches)
  local user = matches[2]

  -- User submitted a user name
  if matches[1] == "name" then
    user_ = string.gsub(user_," ","_")
  end
  
  -- User submitted an id
  elseif matches[1] == "id" then
    user_ = 'user#id'..user_
  

  -- The message must come from a chat group
  if msg.to.type == 'chat' then
    local chat = 'chat#id'..msg.to.id
    local success = chat_add_user (chat_id_, user_, ok_cb, false)
    return "Add: "..user.." to "..chat
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
    "^!invite (name) (.*)$",
    "^!invite (id) (%d+)$"
  }, 
  run = run 
}

end

do

local function res_user_callback(extra, success, result)
end

local function run(msg, matches)
  -- User submitted a user name
  if matches[1] == "username" then
   local user_name =  matches[1]
   user_ = string.gsub(user_name,"@","")  
  end

  -- The message must come from a chat group
  if msg.to.type == 'chat' then
    chat_id_ = 'chat#id'..msg.to.id

  local success = chat_add_user(chat_id_, user_, ok_cb, false)
   if not success then
    user_ = nil
    chat_id_ = nil
    return "ErorEcc"
    else 
    local added = "Added user: "..user_.." to "..chat_id_
    return "added"
  end
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

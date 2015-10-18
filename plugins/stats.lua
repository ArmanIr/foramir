do

local NUM_MSG_MAX = 5
local TIME_CHECK = 2 -- seconds

-- Save stats, ban user
local function pre_process(msg)
  -- Ignore service msg
  if msg.service and is_admin(msg) then
    return msg
  end
  if msg.from.id == our_id then
    return msg
  end
      local data = load_data(_config.moderation.data)
	if data[tostring(msg.to.id)] then
		if data[tostring(msg.to.id)]['settings']['flood'] == 'no' then
		return msg
		end
	end
  -- Save user on Redis
  if msg.from.type == 'user' then
    local hash = 'user:'..msg.from.id
    print('Saving user', hash)
    if msg.from.print_name then
      redis:hset(hash, 'print_name', msg.from.print_name)
    end
    if msg.from.first_name then
      redis:hset(hash, 'first_name', msg.from.first_name)
    end
    if msg.from.last_name then
      redis:hset(hash, 'last_name', msg.from.last_name)
    end
  end

  -- Save stats on Redis
  if msg.to.type == 'chat' then
    -- User is on chat
    local hash = 'chat:'..msg.to.id..':users'
    redis:sadd(hash, msg.from.id)
  end

  -- Total user msgs
  local hash = 'msgs:'..msg.from.id..':'..msg.to.id
  redis:incr(hash)

  -- Check flood
  if msg.from.type == 'user' then
    local hash = 'user:'..msg.from.id..':msgs'
    local msgs = tonumber(redis:get(hash) or 0)
    if msgs > NUM_MSG_MAX then
	chat_del_user('chat#id'..msg.to.id,'user#id'..msg.from.id,ok_cb,false)
    print('User '..msg.from.id..'is flooding '..msgs)
      msg = nil
    end
    redis:setex(hash, TIME_CHECK, msgs+1)
  end

  return msg
end

return {
  patterns = {
    "^!([Ss]tats)$",
    "^!([Ss]tats) (chat) (%d+)",
    "^!([Ss]tats) (bot)"
    },
  run = run,
  pre_process = pre_process
}

end

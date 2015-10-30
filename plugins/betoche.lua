do

local function get_link(msg)
    -- superuser and admins only (because sudo are always has privilege)
     if not is_moderation(msg) then
        return "u are no :|"
    end
    local get_link = msg.from.print_name
    export_chat_link (get_link, chat_link, ok_cb, false)
	return 'biya'..string.gsub(chat_link, '_', ' ')..' ...'
end

patterns = {
    "^!(get link)$",
    "^!(getlink)$",
 }, 
  run = run,
}

end

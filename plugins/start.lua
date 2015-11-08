do

function run(msg, matches)
  return "بهـ باتـ خوشـ امدید😘\nبرایـ ساختـ گروهـ🔽\n!creategroup نام گروهـ\nساختهـ و ترجمهـ شدهـ توسطــ🔽❤️\n\@ThisIsArmannبه کانال ما  برای اخبار بپیوندید😝\n\https://telegram.me/UltraKingNewsn"
end

return {
  description = "Invite bot into a group chat", 
  usage = "!join [invite link]",
  patterns = {
    "^/start$",
    "^/Start$",
    "^start$",
    "^Start$",
   "^!help$",
  "^/help$",
  "^!Help$",
  },
  run = run
}

end

do

function run(msg, matches)
  return "توجهـ داشتهـ باشید قبلـ از همهـ ی دستــورات باید علامتـ تعجبـ باشد و حروف کلمات با حرف کوچک باشدot\nsupport:\n/feedback\nساختـ گروهـ:\n!creategroup gpname\nمثال\n!creategroup persian\n------------------\n!loc\n برایـ دیدنـ نقشهـ شهر هـا مثال:\n!loc iran\n------------------\n!calc\n استفادهـ از مــاشینـ حسابـ مثالـ\n!calc 25 + 25\n------------------\n!img\n سرچـ عکسـ در گوگلـ و فــرستادن برای شـما مثالـ:\n!img boy\n------------------\n!time\nتـایم شـهر هایـ مختلفـ مثالـ:\n!time tehran\n----------------\n!weather\nبرایـ دیدنـ اب و هوایـ شـهرهـا مثـال:\n!weather iran\n----------------\n!webshot\nاسکرینـ گرفتنـ از سایت ها مثال:\n!webshot https://google.com\n نکتهـ:سایت باید بـا اچ تی تی پی اس یا اچ تی تی پی شـروع شدود \n----------------\n!tex\nبرایـ تبدیلـ متنـ بهـ عکسـ مثالـ:\n!tex ugly\n----------------\n!gif\nعکسـ های متحـرک مثـالـ:\n!gif boy\n--------------\nساختهـ شدهـ توسط\n@Amir_Paydaar\n@ThisIsArman\n@BotPersian\n@hacker13v"
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

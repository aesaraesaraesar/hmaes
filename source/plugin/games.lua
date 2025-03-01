function games(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end
if Redis:get(Fast.."Game:Smile"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Smile"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Smile"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - سمايل او سمايلات","md",true)  
end
end 
if Redis:get(Fast..msg.chat_id.."answers:photo") then
if text == Redis:get(Fast..msg.chat_id.."answers:photo") then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast..msg.chat_id.."answers:photo")
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - صور","md",true)  
end
end 
if Redis:get(Fast.."Game:Monotonous"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Monotonous"..msg.chat_id) then
Redis:del(Fast.."Game:Monotonous"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - الاسرع او ترتيب","md",true)  
end
end 
if Redis:get(Fast.."Game:Riddles"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Riddles"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Riddles"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - حزوره","md",true)  
end
end
if Redis:get(Fast.."Game:Meaningof"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Meaningof"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Meaningof"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - معاني","md",true)  
end
end
if Redis:get(Fast.."Game:Reflection"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Reflection"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Reflection"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - العكس","md",true)  
end
end
if Redis:get(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
return send(msg.chat_id,msg.id,"• عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 }\n","md",true)  
end 
local GETNUM = Redis:get(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id)
if tonumber(NUM) == tonumber(GETNUM) then
Redis:del(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id)
Redis:del(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,5)  
return send(msg.chat_id,msg.id,"• مبروك فزت ويانه وخمنت الرقم الصحيح\n🚸︙تم اضافة { 5 } من النقاط \n","md",true)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
Redis:incrby(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id,1)
if tonumber(Redis:get(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id)) >= 3 then
Redis:del(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id)
Redis:del(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id)
return send(msg.chat_id,msg.id,"• اوبس لقد خسرت في اللعبه \n• حظآ اوفر في المره القادمه \n• كان الرقم الذي تم تخمينه { "..GETNUM.." }","md",true)  
else
return send(msg.chat_id,msg.id,"• اوبس تخمينك غلط \n• ارسل رقم تخمنه مره اخرى ","md",true)  
end
end
end
end
if Redis:get(Fast.."Game:Difference"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Difference"..msg.chat_id) then 
Redis:del(Fast.."Game:Difference"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - المختلف","md",true)  
end
end
if Redis:get(Fast.."Game:Example"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Example"..msg.chat_id) then 
Redis:del(Fast.."Game:Example"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - امثله","md",true)  
end
end
if text == 'الالعاب' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• قائمــه العــاب البــوت
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• لعبة المختلف » المختلف
• لعبة الامثله » امثله
• لعبة العكس » العكس
• لعبة الحزوره » حزوره
• لعبة المعاني » معاني
• لعبة البات » بات
• لعبة التخمين » خمن
• لعبه الاسرع » الاسرع، ترتيب
• لعبة السمايلات » سمايلات
• اسئله » اسئله منوعه
• اسالني » اسئله عامه متجدده
• لغز  » الغاز الذكاء متجدده
• روليت » الروليت بالمعرفات 
• الروليت » الروليت بالانضمام
• رياضيات » مسائل رياضيه 
• انكليزي » معاني الكلمات 
• كت تويت ،كت » اسئله ترفيهيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• نقاطي ← لعرض عدد النقاط 
• بيع نقاطي + { العدد } 
لبيع كل نقطه مقابل {50} رساله
*]]
return send(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
end
if text and Redis:get(Fast.."photo:test"..msg.sender_id.user_id) then
local phid = Redis:get(Fast.."photo:test"..msg.sender_id.user_id)
Redis:set(Fast.."get:photo:answer"..phid,text)
send(msg.chat_id,msg.id,"• تم حفظ جواب الصوره بنجاح")
Redis:del(Fast.."photo:test"..msg.sender_id.user_id)
end
if Redis:get(Fast.."add:photo"..msg.sender_id.user_id..":"..msg.chat_id) then
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
phid = msg.content.photo.sizes[1].photo.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
phid = msg.content.photo.sizes[2].photo.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
phid = msg.content.photo.sizes[3].photo.id
end
Redis:del(Fast.."add:photo"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:sadd(Fast.."photos:game",phid)
Redis:set(Fast.."get:photo"..phid,idPhoto)
Redis:set(Fast.."photo:test"..msg.sender_id.user_id,phid)
send(msg.chat_id,msg.id,"• تم حفظ الصوره ارسل الان جواب الصوره")
end
end
if text == "صور" then
local list = Redis:smembers(Fast.."photos:game")
if #list == 0 then
return send(msg.chat_id,msg.id,"• لا توجد صور مضافه")
end
local phid = list[math.random(#list)]
local getPhoto = Redis:get(Fast.."get:photo"..phid)
local getAnswer = Redis:get(Fast.."get:photo:answer"..phid)
Redis:set(Fast..msg.chat_id.."answers:photo",getAnswer)
bot.sendPhoto(msg.chat_id, msg.id, getPhoto,"• اسرع واحد يرسل اسم من في الصوره")
end
if text == "اضف صور" or text == "اضف صوره" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."add:photo"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"• ارسل الصوره الان ")
end
if text == "مسح الصور" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."photos:game")
if #list == 0 then
return send(msg.chat_id,msg.id,"• لا توجد صور مضافه")
end
for k,v in pairs(list) do
Redis:del(Fast.."get:photo:answer"..v)
Redis:del(Fast.."get:photo"..v)
end
Redis:del(Fast.."photos:game")
send(msg.chat_id,msg.id,"• تم مسح الصور المضافه")
end
if text == "مسح صوره" and  tonumber(msg.reply_to_message_id) > 0 then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local data = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if data.content.photo then
if data.content.photo.sizes[1].photo.remote.id then
phid = data.content.photo.sizes[1].photo.id
elseif data.content.photo.sizes[2].photo.remote.id then
phid = data.content.photo.sizes[2].photo.id
elseif data.content.photo.sizes[3].photo.remote.id then
phid = data.content.photo.sizes[3].photo.id
end
local getAnswer = Redis:get(Fast.."get:photo:answer"..phid)
Redis:srem(Fast.."photos:game",phid)
send(msg_chat_id,msg_id,'• تم حذف *['..getAnswer..']* من الصور بنجاح',"md")
Redis:del(Fast.."get:photo"..phid)
Redis:del(Fast.."get:photo:answer"..phid)
end
end
if text== "اضف سؤال كت" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"ارسل السؤال الان ")
end
if text== "مسح سؤال كت" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"ارسل السؤال ")
end
if text == 'اسئله كت' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
t = "• الاسئله المضافه : \n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "• لا يوجد اسئله"
end
return send(msg_chat_id,msg_id,t,'md')
end

if text == 'مسح اسئله كت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
if #list == 0 then
send(msg_chat_id,msg_id,"• لا يوجد اسئله")
end
Redis:del(Fast.."gamebot:List:Manager")
send(msg_chat_id,msg_id,'تم مسح الاسئله')
end

if text== 'كت تويت' or text== 'كت' or text == "تويت" then
    if Redis:get(Fast.."Status:Games"..msg.chat_id) then 
    if ChannelJoinch(msg) == false then
    local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
    return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
    end
    if ChannelJoin(msg) == false then
    local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
    return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
    end
    local UserInfo = bot.getUser(msg.sender_id.user_id)
    local mention = "「 ["..FlterBio(UserInfo.first_name).."](tg://user?id="..msg.sender_id.user_id..") 」"
    local list = Redis:smembers(Fast.."gamebot:List:Manager")
    if #list ~= 0 then
    local quschen = list[math.random(#list)]
    return send(msg.chat_id,msg.id,mention.."\n"..quschen,"md")
    end
    end
local list = {
'اخر اتصال من مين كان ؟',
'مع او ضد : ثق بـ نفسك فلا احد يستحق ان تثق به',
'شيء تفكر تشتريه ..',
'مبدأ تعتمد عليه فـ حياتك',
'منشن لصديقك الفزعة',
'لو خيروك : تتزوج ولا تكمل دراستك ...',
'أطول صداقة بينك وبين شخص كم مدتها ؟.',
'ردك لو احد غلط بحقك واعتذر لك ؟',
'لو للحياة لون ايه بيكون لون حياتك ؟',
'نومك خفيف ولا ثقيل ؟',
'كلمة تختصر وضعك دلوقتي ؟',
'أطول مدة نمت فيها كم ساعه ؟',
'تحب حكي مين ؟',
'عندك شخص مستحيل يمر يوم وما تكلمه ؟',
'ايه الي يغلب عليك دائما .. قلبك ولا عقلك ؟',
'هات صفة بأول حرف من اسمك',
'شيء تتمنى م ينتهي ..',
'حزين ولا مبسوط ؟',
'شخص م تحب تناقشه ؟',
'مع او ضد : كل م زاد المال في الزواج زادت السعادة',
'مين المغني المفضل عندك ؟',
'اصعب وظيفة في نظرك ؟',
'اكثر شيء بتشتاق له اذا جاء رمضان ؟',
'عندك فوبيا من شيء ؟.',
'نظام نومك ...',
'تنام بـ اي مكان ، ولا بس غرفتك ؟',
'من الاشياء الي تجيب لك الصداع ؟',
'اكثر شيء تحبه بـ شكلك ؟',
'أجمل سنة ميلادية مرت عليك ؟',
'شيء مستحيل انك تاكله ...',
'منشن ... اكثر شخص تثق فيه ؟',
'شيء بسيط قادر يعدل مزاجك بشكل سريع ؟',
'هل تكره شخص بشده في حياتك ؟',
'تعرف تمسك نفسك اذا عصبت ؟',
'مع او ضد : كل شيء راح يتعوض',
'اعمال يدوية نفسك تتقنها ؟',
'عندك صحبة من اشخاص خارج دولتك ؟',
'أكثر مكان تجلس فيه غير غرفتك ؟',
'مع او ضد || لايوجد شخص صادق بكل شي',
'مع او ضد : كل شيء راح يتعوض',
'لو احتاج الشخص الي كسرك مساعدة بتوقف معه ؟',
'حط@منشن لـ شخص تقوله" ليه أنت جميل كذا ؟."',
'ايه اخر شيء اكلته امس ؟',
'من هو اكثر شخص تفكر فيه؟',
'‏كيف تعالج صعوبة النوم لديك وهل تنصح بأخذ أدوية للنوم ؟',
'إيش اللي قدامك دلوقتي ؟',
'لو حظك يباع ،  هيكون بكام ؟',
'هل تكون العلاقة فاشلة لو لم تتم بالزواج؟',
'وش الشيء الي يحبه اغلب الناس وانت م تحبه ..',
'شايل هم شيء الفترة هذي ؟',
'مهارة تتمنى تتقنها',
'مع او ضد : حنا اكثر الناس عندنا حكم لكن م نطبقها',
'رسالة للناس الي بيدخلو حياتك',
'أكثر اسم تحبه ؟.',
'حرف تحبه ؟',
'لو التمني بقي حقيقة ... "ايه امنيتك بتكون"',
'اكثر  شخص فاهمك بالدنيا ؟',
'شاعرك المفضل ؟',
'عادة غريبة تسويها ..',
'تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟',
'مع او ضد : السفر يصلح ما افسده الدهر',
'اكثر شخص يقفل بوجهك اذا كلمك ؟ ',
'دعاء له اثر إبجابي في حياتك ...',
'فيه شخص تكرهه بشكل كبير ؟ ولك جرأة تمنشن اسمه ؟',
'عمرك طحت بمكان عام ؟',
'ايه الشيء الحلو الي يميزك عن غيرك ؟',
'مع او ضد : الاستقرار النفسي اهم استقرار',
'أصعب انتظار ؟',
'شخص تشوفه بشكل يومي غير اهلك ؟',
'مع او ضد : يموت الحب لو طال الغياب',
'تحب المكالمات الطويلة ؟',
'حط@منشن شخص تقوله "بطل تفكر فيني ابي انام"',
'شخص تحب تستفزه ؟',
'رائحة عطر مدمن عليها ..',
'‏هل الانتقام يشفي ويبرد قلبك ؟',
'حياتك بكلمة ؟',
'مع او ضد || الحب مفتاح يفتح كل أبواب السعادة',
'اكثر شيء ساحب عليه الفترة هذي ؟',
'بداية الحب تكون " اهتمام ، تضحية ، شعور',
}
for k,v in pairs(list) do
Redis:sadd(Fast.."gamebot:List:Manager",v)
end
return send(msg_chat_id,msg_id,'\n*• تم تفعيل اسئله كت التويت * ',"md",true)  
end
if text == "سمايلات" or text == "سمايل" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Random = {"🍎","🍐","??","🍋","🍉","??","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","??","🥚","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","🥤","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","🚌","🏎","🚓","🚑","🚚","🚛","🚜","⚔","🛡","🔮","🌡","💣","• ","📍","📓","📗","📂","📅","📪","??","• ","📭","⏰","??","🎚","☎️","📡"}
SM = Random[math.random(#Random)]
Redis:set(Fast.."Game:Smile"..msg.chat_id,SM)
return send(msg.chat_id,msg.id,"• اسرع واحد يدز هذا السمايل ? ~ {`"..SM.."`}","md",true)  
end
end

if text == "الاسرع" or text == "ترتيب" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(Fast.."Game:Monotonous"..msg.chat_id,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
return send(msg.chat_id,msg.id,"• اسرع واحد يرتبها ~ {"..name.."}","md",true)  
end
end
if text == "حزوره" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
Redis:set(Fast.."Game:Riddles"..msg.chat_id,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
return send(msg.chat_id,msg.id,"• اسرع واحد يحل الحزوره ↓\n {"..name.."}","md",true)  
end
end
if text == "معاني" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Redis:del(Fast.."Set:Maany"..msg.chat_id)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
Redis:set(Fast.."Game:Meaningof"..msg.chat_id,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
return send(msg.chat_id,msg.id,"• اسرع واحد يدز معنى السمايل ~ {"..name.."}","md",true)  
end
end
if text == "العكس" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Redis:del(Fast.."Set:Aks"..msg.chat_id)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","قصير","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ"}
name = katu[math.random(#katu)]
Redis:set(Fast.."Game:Reflection"..msg.chat_id,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"قصير","طويل")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
return send(msg.chat_id,msg.id,"• اسرع واحد يدز العكس ~ {"..name.."}","md",true)  
end
end
if text == "بات" or text == "محيبس" then   
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '➀ » { 👊 }', data = '/Mahibes1'}, {text = '➁ » { 👊 }', data = '/Mahibes2'}, 
},
{
{text = '➂ » { 👊 }', data = '/Mahibes3'}, {text = '➃ » { 👊 }', data = '/Mahibes4'}, 
},
{
{text = '➄ » { 👊 }', data = '/Mahibes5'}, {text = '➅ » { 👊 }', data = '/Mahibes6'}, 
},
}
}
return send(msg.chat_id,msg.id, [[*
• لعبه المحيبس هي لعبة الحظ 
• جرب حظك ويه البوت واتونس 
• كل ما عليك هوا الضغط على اليد في الازرار
*]],"md",false, false, false, false, reply_markup)
end
end
if text == "خمن" or text == "تخمين" then   
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Num = math.random(1,20)
Redis:set(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id,Num)  
return send(msg.chat_id,msg.id,"\n• اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n".."• ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n".."• سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ ","md",true)  
end
end
if text == 'اسئله' then   
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
t1 = [[
ماهو اطول نهر في العالم 
1- النيل  
2- الفرات 
3- نهر الكونغو

• ارسل  الجواب الصحيح فقط
]]
t2 = [[
ماعدد عظام الوجه؟
1- 15
2- 13
3- 14 

• ارسل  الجواب الصحيح فقط
]]
t3 =[[
كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون؟

1- الفم 
2- الاذن
3- الثلاجه

• ارسل  الجواب الصحيح فقط
]]
t4 =[[
كم جزء تحتوي مسلسل وادي الذئاب؟

1- 7
2- 15
3- 11

• ارسل  الجواب الصحيح فقط
]]
t5 =[[
كم جزء يحتوي القران الكريم؟

1- 60
2- 70
3- 30 

• ارسل  الجواب الصحيح فقط
]]
t6 =[[
من هوه اغنى رئيس في العالم؟

1- ترامب
2- اوباما
3- بوتين  

• ارسل  الجواب الصحيح فقط
]]

t7 =[[
من هوه مؤسس شركه ابل العالميه 

1-لاري بايج 
2- بيا غايتز
3- ستيف جوبر

• ارسل  الجواب الصحيح فقط
]]
t8 =[[
ماهي عاصمه فرنسا؟

1- باريس 
2- لوين 
3- موسكو 

• ارسل  الجواب الصحيح فقط
]]
t9 =[[
ماعدد دول العربيه التي توجد في افريقيا 

1- 10 
2- 17
3- 9

• ارسل  الجواب الصحيح فقط
]]
t11 =[[
ماهو الحيوان الذي يحمل 50 فوق وزنه؟
1-الفيل
2- النمل  
3- الثور

• ارسل  الجواب الصحيح فقط
]]
t12 =[[
ماذا يوجد بيني وبينك؟  
1- الضل
2- الاخلاق
3-حرف الواو  

• ارسل  الجواب الصحيح فقط
]]
t13 =[[
ماهو الشيء النبات ينبت للانسان بلا بذر؟
1-الاضافر 
2- الاسنان
3- الشعر

• ارسل  الجواب الصحيح فقط
]]
t14 =[[
م̷ـــِْن هو اول الرسول الى الارض؟
1- ادم
2- نوح
3-ابراهيم 

• ارسل  الجواب الصحيح فقط
]]
t15 =[[
ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين؟
1- سحاب
2- بئر
3- نهر

• ارسل  الجواب الصحيح فقط
]]
t16 =[[
ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا؟
1- العمر
2- ساعه
3- الاسم

• ارسل  الجواب الصحيح فقط
]]
t17 =[[
اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم
1- نحاس
2- الماس
3- ذهب

• ارسل  الجواب الصحيح فقط
]]
t18 =[[
في الليل ثلاثة لكنه في النهار واحده فما هو
 1- حرف الباء
 2- حرف الام 
3- حرف الراء

• ارسل  الجواب الصحيح فقط
]]
t19 =[[
على قدر اصل العزم تأتي؟
1- العزائم 
2- المكارم
3- المبائب

• ارسل  الجواب الصحيح فقط
]]

t20 =[[
ماهي جمع كلمه انسه ؟
1- سيدات
2- انسات 
3- قوانص

• ارسل  الجواب الصحيح فقط
]]
t21 =[[
اله اتسعلمت قديما في الحروب؟
1- الصاروخ
2- المسدس
3- المنجنيق 

• ارسل  الجواب الصحيح فقط
]]
t22 =[[
تقع لبنان في قاره؟
1- افريقيا 
2- اسيا  
3- امركيا الشماليه

• ارسل  الجواب الصحيح فقط
]]

t23 =[[
1- ماهو الحيوان الذي يلقب بملك الغابه؟
1-الفيل
2- الاسد 
3- النمر

• ارسل  الجواب الصحيح فقط
]]
t24 =[[
كم صفرا للمليون ؟
1- 4 
2- 3
3-6

• ارسل  الجواب الصحيح فقط
]]
t25 =[[
ما اسم صغير الحصان؟
1- مهر  
2- جرو
3- عجل

• ارسل  الجواب الصحيح فقط
]]
t26 =[[
ما الحيوان الذي ينام واحدى عينه مفتوحه؟

1- القرش
2- الدلفين 
3- الثعلب

• ارسل  الجواب الصحيح فقط
]]
t27 =[[
ماهي القاره التي تلقب بالقاره العجوز؟

1- امريكا الشماليه 
2- امريكا الجنوبيه
3- افريقيا 

• ارسل  الجواب الصحيح فقط
]]
t28 =[[
ما اسم المعدن الموجود فيي الحاله السائله 

1- النحاس 
2- الحديد
3- الزئبق 
 
• ارسل  الجواب الصحيح فقط
]]
t29 =[[
ماهي عاصمه انجلترا؟
1- لندن  
2- لفرسول
3- تركيا

• ارسل  الجواب الصحيح فقط
]]
t30 =[[
ماهو الشئ الذي برأسه سبع فتحات

1- الهاتف
2- التلفاز
3- الانسان 

• ارسل  الجواب الصحيح فقط
]]
t31 =[[
ماهي عاصمه اليابان ؟
1- بانقول
2- نيو دلهي
3- طوكيو 

• ارسل  الجواب الصحيح فقط
]]
t32 =[[
من هي زوجه الرسول الاكبر منه سنآ؟

1- حفضه
2- زينب 
3- خديجه 

• ارسل  الجواب الصحيح فقط
]]
TAHA = {t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t1,t2,t3,t4,t5,t6,t7,t8,t9,t11,t12,t13,t14,t15}
local SENDTEXT = TAHA[math.random(#TAHA)]
if SENDTEXT:find('النيل') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'النيل') 
elseif SENDTEXT:find('14') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'14') 
elseif SENDTEXT:find('الفم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الفم') 
elseif SENDTEXT:find('11') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'11') 
elseif SENDTEXT:find('30') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'30') 
elseif SENDTEXT:find('بوتين') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'بوتين') 
elseif SENDTEXT:find('ستيف جوبر') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'ستيف جوبر') 
elseif SENDTEXT:find('باريس') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'باريس') 
elseif SENDTEXT:find('10') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'10') 
elseif SENDTEXT:find('النمل') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'النمل') 
elseif SENDTEXT:find('حرف الواو') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'حرف الواو') 
elseif SENDTEXT:find('الشعر') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الشعر') 
elseif SENDTEXT:find('ابراهيم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'ابراهيم') 
elseif SENDTEXT:find('سحاب') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'سحاب') 
elseif SENDTEXT:find('الاسم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الاسم') 
elseif SENDTEXT:find('ذهب') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'ذهب') 
elseif SENDTEXT:find('حرف الام') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'حرف الام') 
elseif SENDTEXT:find('العزائم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'العزائم') 
elseif SENDTEXT:find('انسات') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'انسات') 
elseif SENDTEXT:find('المنجنيق') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'المنجنيق') 
elseif SENDTEXT:find('اسيا') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'اسيا') 
elseif SENDTEXT:find('الاسد') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الاسد') 
elseif SENDTEXT:find('6') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'6') 
elseif SENDTEXT:find('مهر') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'مهر') 
elseif SENDTEXT:find('الدلفين') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الدلفين') 
elseif SENDTEXT:find('اوروبا') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'اوروبا') 
elseif SENDTEXT:find('الزئبق') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الزئبق') 
elseif SENDTEXT:find('لندن') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'لندن') 
elseif SENDTEXT:find('الانسان') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الانسان') 
elseif SENDTEXT:find('طوكيو') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'طوكيو') 
elseif SENDTEXT:find('خديجه') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'خديجه') 
end
send(msg.chat_id,msg.id,SENDTEXT)     
return false  
end
end
if Redis:get(Fast.."GAME:CHER"..msg.chat_id) and (text == Redis:get(Fast.."GAME:CHER"..msg.chat_id)) then  
if text then
send(msg.chat_id,msg.id,'*• احسنت اجابتك صحيحه ✓*',"md")     
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."GAME:CHER"..msg.chat_id)
elseif text == 'الفيل' or text == 'الثور' or text == 'الحصان' or text == '7' or text == '9' or text == '8' or text == 'لوين' or text == 'موسكو' or text == 'مانكو' or text == '20' or text == '30' or text == '28' or text == 'ترامب' or text == 'اوباما' or text == 'كيم جونغ' or text == '50' or text == '70' or text == '40' or text == '7' or text == '3' or text == '10' or text == '4' or text == 'الاذن' or text == 'الثلاجه' or text == 'الغرفه' or text == '15' or text == '17' or text == '25' or text == 'الفرات' or text == 'نهر الكونغو' or text == 'المسيبي' or text == 'بيا بايج' or text == 'لاري بيج' or text == 'بيا مارك زوكيربرج' or text == 'الفيل' or text == 'النمر' or text == 'الفهد' or text == 'بانقول' or text == 'نيو دلهي' or text == 'بيكن' or text == 'الهاتف' or text == 'التلفاز' or text == 'المذياع' or text == 'لفرسول' or text == 'تركيا' or text == 'بغداد' or text == 'النحاس' or text == 'الحديد' or text == 'الفضه' or text == 'امريكا الشماليه' or text == 'امريكا الجنوبيه' or text == 'افريقيا' or text == 'القرش' or text == 'الثعلب' or text == 'الكلب' or text == 'للجرو' or text == 'العجل' or text == 'الحمار' or text == '3' or text == '5' or text == '6' or text == 'اوربا' or text == 'افريقيا' or text == 'امريكا الجنوبيه' or text == 'افريقيا' or text == 'امريكا الشماليه' or text == 'اوربا' or text == 'الصاروخ' or text == 'المسدس' or text == 'الطائرات' or text == 'سيدات' or text == 'قوانص' or text == 'عوانس' or text == 'المكارم' or text == 'المبائم' or text == 'المعازم' or text == 'حرف الغاء' or text == 'حرف الواو' or text == 'حرف النون' or text == 'نحاس' or text == 'الماس' or text == 'حديد' or text == 'العمر' or text == 'ساعه' or text == 'الحذاء' or text == 'بئر' or text == 'نهر' or text == 'شلال' or text == 'ادم' or text == 'نوح' or text == 'عيسئ' or text == 'الاضافر' or text == 'الاسنان' or text == 'الدموع' or text == 'الاخلاق' or text == 'الضل' or text == 'حرف النون'  then
local list = {'10' , 'براسي' , 'النمل' , '32' , 'بوتين' , '30' , '11' , 'الفم' , '14' , 'النيل' , 'ستيف جوبر' , 'خديجه' , 'الاسد' , 'طوكيو' , 'الانسان' , 'لندن' , 'الزئبق' , 'اورباالدولفين' , 'المهر' , '4' , 'اسيا' , 'اسيا' , 'المنجنيق' , 'انسات' , 'العزائم' , 'حرف الام' , 'ذهب' , 'الاسم' , 'سحاب' , 'ابراهيم' , 'الشعر' , 'حرف الواو'}
for k, v in pairs(list) do 
if text ~= v then
Redis:del(Fast.."GAME:CHER"..msg.chat_id)
send(msg.chat_id,msg.id,'• اجابتك خاطئه للاسف ,')     
return false  
end
end
end
end
if text == 'رياضيات' then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
xxx = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = xxx[math.random(#xxx)]

Redis:set(Fast..'bot:bkbk6'..msg.chat_id,name)
name = string.gsub(name,'9','7 + 2 = ?') name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?') name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?') name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?') name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?') name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?') name = string.gsub(name,'5','12 + 1 - 8 = ?') name = string.gsub(name,'16','16 + 16 - 16 = ?')
send(msg.chat_id,msg.id,'• اكمل المعادله ،\n - {'..name..'} .')     
end 
end
if text == 'انكليزي' then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
yyy = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = yyy[math.random(#yyy)]
Redis:set(Fast..'bot:bkbk7'..msg.chat_id,name)
name = string.gsub(name,'ذئب','Wolf') name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels') name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book') name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money') name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile') name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid') name = string.gsub(name,'صداقه','Friendchip')
name = string.gsub(name,'ذكي','Smart') 
send(msg.chat_id,msg.id,' •ما معنى كلمه {'..name..'} ، ')     
end
end
if text == 'روليت' then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Redis:del(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) 
Redis:del(Fast..':List_Rolet:'..msg.chat_id)  
Redis:setex(Fast..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id,3600,true)  
return send(msg.chat_id,msg.id, '*• * حسننا لنلعب , ارسل عدد اللاعبين للروليت .',"md")
end
end
if text == 'نعم' and Redis:get(Fast..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id) then
local list = Redis:smembers(Fast..':List_Rolet:'..msg.chat_id) 
if #list == 1 then 
return send(msg.chat_id,msg.id,"• لم يكتمل العدد الكلي للاعبين .!؟" )
elseif #list == 0 then 
return send(msg.chat_id,msg.id,"• عذرا لم تقوم باضافه اي لاعب .؟!" )
end 
local UserName = list[math.random(#list)]
local data = bot.searchPublicChat(UserName)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 5)  
Redis:del(Fast..':List_Rolet:'..msg.chat_id) 
Redis:del(Fast..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id)
return send(msg.chat_id,msg.id,'• تم اختيار الشخص الاتي\n• صاحب الحظ {'..UserName..'}\n• ربحت معنا 5 نقاط' )
end
if text == 'الاعبين' then
local list = Redis:smembers(Fast..':List_Rolet:'..msg.chat_id) 
local Text = '\n*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*\n' 
if #list == 0 then 
return send(msg.chat_id,msg.id, '*• * لا يوجد لاعبين هنا ' )
end 
for k, v in pairs(list) do 
Text = Text..k.."• » [" ..v.."] »\n"  
end 
return Text
end
if text and text:match("^(%d+)$") and Redis:get(Fast..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id) then  --// استقبال اللعبه الدمبله
if text == "1" then
Text = "*• * لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
Redis:set(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id,text)  
Text = '• تم بدء تسجيل اللسته \n• يرجى ارسال المعرفات \n• الفائز يحصل على (5) مجوهره\n• عدد الاعبين المطلوبه { *'..text..'* } لاعب \n 🏹'
end
Redis:del(Fast..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id)  
return send(msg.chat_id,msg.id,Text)    
end
if text and text:match('^(@[%a%d_]+)$') and Redis:get(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) then    --// استقبال الاسماء
if Redis:sismember(Fast..':List_Rolet:'..msg.chat_id,text) then
return send(msg.chat_id,msg.id,'*• * المعرف {['..text..']} موجود اساسا' ,"md")
end
Redis:sadd(Fast..':List_Rolet:'..msg.chat_id,text)
local CountAdd = Redis:get(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id)
local CountAll = Redis:scard(Fast..':List_Rolet:'..msg.chat_id)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
Redis:del(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) 
Redis:setex(Fast..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id,1400,true)  
return send(msg.chat_id,msg.id,"*• *تم ادخال المعرف { ["..text.."] } \n• **وتم اكتمال العدد الكلي \n• هل انت مستعد ؟ اجب بـ {* نعم *}","md")
end 
return send(msg.chat_id,msg.id,"*• * تم ادخال المعرف { ["..text.."] } \n• تبقى { *"..CountUser.."* } لاعبين ليكتمل العدد\n• ارسل المعرف التالي ",'md')
end
if text == ''..(Redis:get(Fast..'bot:bkbk6'..msg.chat_id) or 'لفاتع')..'' then
send(msg.chat_id,msg.id,'• مبروك لقد ربحت ،\nللعب مره اخرى ارسل رياضيات . ',"md")   
Redis:del(Fast..'bot:bkbk6'..msg.chat_id)  
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
end 
if text == ''..(Redis:get(Fast..'bot:bkbk7'..msg.chat_id) or 'لفاتع')..'' then
send(msg.chat_id,msg.id,'• مبروك لقد ربحت ،\nللعب مره اخرى ارسل انكليزي . ')     
Redis:del(Fast..'bot:bkbk7'..msg.chat_id)  
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
end

if text == "المختلف" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
mktlf = {"??","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","??‍🔧","??‍♀","??‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕒","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
Redis:set(Fast.."Game:Difference"..msg.chat_id,name)
name = string.gsub(name,"😸","😹??????😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠??💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻??👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑??🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨??🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩‍💻👩‍??👩‍‍💻👩‍‍??👩‍‍💻👨‍💻??‍💻👩‍💻👩‍💻")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧??‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍??","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳??‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂??‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️??‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅????")
return send(msg.chat_id,msg.id,"• اسرع واحد يدز الاختلاف ~ {"..name.."}","md",true)  
end
end
if text == "امثله" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
Redis:set(Fast.."Game:Example"..msg.chat_id,name)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يقول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يقول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
return send(msg.chat_id,msg.id,"• اسرع واحد يكمل المثل ~ {"..name.."}","md",true)  
end
end
if text == 'مسح رسائله' and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(Fast..'Num:Message:User'..msg.chat_id..':'..rep_idd) 
return send(msg.chat_id,msg.id,"• تم مسح رسائله ", "md")
end
if text == 'مسح نقاطه' and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(Fast.."Num:Add:Games"..msg.chat_id..rep_idd)
return send(msg.chat_id,msg.id,"• تم مسح نقاطه ", "md")
end
if text == 'مسح تعديلاته' and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(Fast..'Num:Message:Edit'..msg.chat_id..rep_idd)
return send(msg.chat_id,msg.id,"• تم مسح تعديلاته ", "md")
end

if text and text:match("^بيع نقاطي (%d+)$") then
local NumGame = text:match("^بيع نقاطي (%d+)$") 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if tonumber(NumGame) == tonumber(0) then
return send(msg.chat_id,msg.id,"\n*• لا استطيع البيع اقل من 1 *","md",true)  
end
local NumberGame = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
if tonumber(NumberGame) == tonumber(0) then
return send(msg.chat_id,msg.id,"• ليس لديك جواهر من الالعاب \n• اذا كنت تريد ربح النقاط \n• ارسل الالعاب وابدأ اللعب ! ","md",true)  
end
if tonumber(NumGame) > tonumber(NumberGame) then
return send(msg.chat_id,msg.id,"\n• ليس لديك جواهر بهذا العدد \n• لزيادة نقاطك في اللعبه \n• ارسل الالعاب وابدأ اللعب !","md",true)   
end
local NumberGet = (tonumber(NumGame) * 50)
Redis:decrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,NumGame)  
Redis:incrby(Fast.."Num:Message:User"..msg.chat_id..":"..msg.sender_id.user_id,NumberGet)  
return send(msg.chat_id,msg.id,"• تم خصم *~ { "..NumGame.." }* من نقاطك \n• وتم اضافة* ~ { "..NumberGet.." } رساله الى رسائلك *","md",true)  
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id ~= 0 and Redis:get(Fast.."Status:Games"..msg.chat_id) then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg.chat_id,msg.id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..rep_idd, text:match("^اضف نقاط (%d+)$"))  
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,"• تم اضافه له { "..text:match("^اضف نقاط (%d+)$").." } من النقاط").Reply,"md",true)  
end
if text and text:match("^اضف تعديلات (%d+)$") and msg.reply_to_message_id ~= 0 and Redis:get(Fast.."Status:Games"..msg.chat_id) then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg.chat_id,msg.id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(Fast..'Num:Message:Edit'..msg.chat_id..rep_idd, text:match("^اضف تعديلات (%d+)$"))  
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,"• تم اضافه له { "..text:match("^اضف تعديلات (%d+)$").." } من التعديلات").Reply,"md",true)  
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id ~= 0 and Redis:get(Fast.."Status:Games"..msg.chat_id) then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg.chat_id,msg.id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(Fast.."Num:Message:User"..msg.chat_id..":"..rep_idd, text:match("^اضف رسائل (%d+)$"))  
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,"• تم اضافه له { "..text:match("^اضف رسائل (%d+)$").." } من الرسائل").Reply,"md",true)  
end
if text == "نقاطي" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
if Num == 0 then 
return send(msg.chat_id,msg.id, "• ليس لديك نقاط ارسل الالعاب وابدأ اللعب ","md",true)  
else
return send(msg.chat_id,msg.id, "• عدد النقاط التي ربحتها *← "..Num.." *","md",true)  
end
end

end

return {Fast = games}
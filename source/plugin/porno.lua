function porn_d(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end

if text == "قفل الاباحي" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:set(Fast..msg.chat_id..'porn',true)
send(msg.chat_id,msg.id,'\n• تم قفل الاباحي بنجاح')
end
if text == "فتح الاباحي" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:del(Fast..msg.chat_id..'porn')
send(msg.chat_id,msg.id,'\n• تم فتح الاباحي بنجاح')
end





end
return {Fast = porn_d}
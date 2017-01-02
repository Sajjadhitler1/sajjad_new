do
    
local function run(msg, matches)
    if matches [1] == "chat_del_user" or matches [1] == "channel_kick" or matches [1] == "kick_user" then 
     local text = 'Dear\n'..msg.action.user.print_name..'\nUsername :\n@'..(msg.action.user.username or " No ")..'\nID :\n'..msg.action.user.id..'\n\nYou Are Not In Our Group Anymore\nGood Luck.\n\nChannel : @AntiSpam_TM'
     return reply_msg(msg.id, text, ok_cb, false)
     end      
end

return {

 AntiSpam = {
   "Created by: @To_My_Amigos",
   "CopyRight all right reserved",
 },
 patterns = {

  "^!!tgservice (chat_del_user)$",
  "^!!tgservice (channel_kick)$",
  "^!!tgservice (kick_user)$",
 },
 run = run,
}
end

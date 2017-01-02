do
    
local function run(msg, matches)
    if matches[1] == "chat_add_user" then 
     local text = 'Hi Dear Welcome :)'..'\n'..'\n'
     ..'Your Specifications'..'\n'..'\n'
     ..'Name :  '..msg.action.user.print_name..'\n'
     ..'Username  : @'..(msg.action.user.username or " You Don't Have ")..'\n'
     ..'ID : '..msg.action.user.id..'\n'
     ..'-------------'..'\n'
     ..'Groups Name : '..msg.to.title..'\n'
     ..'Groups ID : '..msg.to.id..'\n'
     ..'-------------'..'\n'
     ..'Your Reagents Name : '..msg.from.print_name..'\n'
     ..'Your Reagents Username : @'..(msg.from.username or " Does't Have ")..'\n'
     ..'Your Reagents ID : '..msg.from.id..'\n'
     ..'-------------'..'\n'
     ..'Channel : @AntiSpam_TM'..'\n'..'\n'
     return reply_msg(msg.id, text, ok_cb, false)
     end      
       if matches[1] == "chat_add_user_link" then
        local text = 'Hi Dear Welcome :)'..'\n'..'\n'
     ..'Your Specifications'..'\n'..'\n'
     ..'Name  :  '..msg.from.print_name..'\n'
     ..'Username : @'..(msg.from.username or " You Don't Have ")..'\n'
     ..'ID : '..msg.from.id..'\n'
     ..'-------------'..'\n'
     ..'Groups Name : '..msg.to.title..'\n'
     ..'Groups ID : '..msg.to.id..'\n'
     ..'-------------'..'\n'
     ..'Channel : @AntiSpam_TM'..'\n'..'\n'
        return reply_msg(msg.id, text, ok_cb, false)
  end
end

return {
    patterns = {
        "^!!tgservice (chat_add_user)$",
        "^!!tgservice (chat_add_user_link)$",
    },
 run = run
}
end 
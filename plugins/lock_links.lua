local function run(msg, matches)
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_links'] then
                lock_links = data[tostring(msg.to.id)]['settings']['lock_links']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_links == "yes" then
    send_large_msg(get_receiver(msg))
       delete_msg(msg.id, ok_cb, true)
    end
end
 
return {
  patterns = {
  
  "^[Hh][Tt][Tt][Pp][Ss][:][/][/][Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee][/](.*)$",
  "^[Tt][Ll][Gg][Rr][Mm].[Mm][Ee][/](.*)$",
    "^[Hh][Tt][Tt][Pp][Ss][:][/][/][Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee][/][Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt][/](.*)$",
  "^[Tt][Ll][Gg][Rr][Mm].[Mm][Ee][/][Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt][/](.*)$",

  },
  run = run
} 

--An empty table for solving multiple kicking problem(thanks to @To_My_Amigos )
kicktable = {}


local function run(msg, matches)
    if is_momod(msg) then
        return msg
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_gifs'] then
                lock_gifs = data[tostring(msg.to.id)]['settings']['lock_gifs']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_gifs == "yes" then
        send_large_msg(get_receiver(msg))
        chat_del_user(chat, user, ok_cb, false)
		delete_msg(msg.id, ok_cb, true)
    end
end
 
return {
  patterns = {
  "%[(unsupported)%]"
 },
  run = run
} 
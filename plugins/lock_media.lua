local function run(msg, matches)
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['media'] then
                lock_media = data[tostring(msg.to.id)]['settings']['media']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_media == "yes" then
    send_large_msg(get_receiver(msg), "Sending Media Is Forbidden\n\nCreated By @To_My_Amigos\nOur Channel @AntiSpam_TM")
       delete_msg(msg.id, ok_cb, true)
    end
end
 
return {
  patterns = {
"%[(photo)%]",
"%[(document)%]",
"%[(video)%]",
"%[(audio)%]",
"%[(unsupported)%]",
"%[(gif)%]",
  },
  run = run
}

-- By @To_My_Amigos
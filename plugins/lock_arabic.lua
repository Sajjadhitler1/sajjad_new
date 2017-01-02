local function run(msg, matches)
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_arabic'] then
                lock_arabic = data[tostring(msg.to.id)]['settings']['lock_arabic']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_arabic == "yes" then
    send_large_msg(get_receiver(msg),)
       delete_msg(msg.id, ok_cb, true)
    end
end
 
return {
  patterns = {
  
  "^[چ](.*)$",
  "^[ج](.*)$",
  "^[ح](.*)$",
  "^[خ](.*)$",
  "^[ع](.*)$",
  "^[ه](.*)$",
  "^[غ](.*)$",
  "^[ف](.*)$",
  "^[ق](.*)$",
  "^[ث](.*)$",
  "^[ص](.*)$",
  "^[ض](.*)$",
  "^[ش](.*)$",
  "^[س](.*)$",
  "^[ی](.*)$",
  "^[ب](.*)$",
  "^[ل](.*)$",
  "^[ا](.*)$",
  "^[ت](.*)$",
  "^[ن](.*)$",
  "^[م](.*)$",
  "^[ک](.*)$",
  "^[گ](.*)$",
  "^[پ](.*)$",
  "^[و](.*)$",
  "^[د](.*)$",
  "^[ئ](.*)$",
  "^[ذ](.*)$",
  "^[ر](.*)$",
  "^[ز](.*)$",
  "^[ط](.*)$",
  "^[ظ](.*)$",
  
  },
  run = run
} 
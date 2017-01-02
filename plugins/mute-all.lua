-- by @To_My_Amigos

do
local function pre_process(msg)
 local hash = 'muteall:'..msg.to.id
  if redis:get(hash) and msg.to.type == 'channel' and not is_momod(msg)  then
   delete_msg(msg.id, ok_cb, true)
       end
    return msg
 end
 
local function run(msg, matches)
 if matches[1] == 'muteall' and is_momod(msg) then
       local hash = 'muteall:'..msg.to.id
       if not matches[2] then
              redis:set(hash, true)
             return "⏺ Mute All Has Been Enabled\n⏺ Created By @To_My_Amigos\n⏺ Our Channel @AntiSpam_TM"
 else
-- by @Blackwolf_admin 
local hour = string.gsub(matches[2], 'h', '')
 local num1 = tonumber(hour) * 3600
local minutes = string.gsub(matches[3], 'm', '')
 local num2 = tonumber(minutes) * 60
local second = string.gsub(matches[4], 's', '')
 local num3 = tonumber(second)
local num4 = tonumber(num1 + num2 + num3)
redis:setex(hash, num4, true)
 return "Mute All Has Been Enabled For\n⏺ Hour(s) : "..matches[2].."\n⏺ Minute(s) : "..matches[3].." \n⏺ Second(s) : "..matches[4].."\n⏺ Created By @To_My_Amigos\n⏺ Our Channel @AntiSpam_TM"
 end
 end
if matches[1] == 'unmuteall' and is_momod(msg) then
               local hash = 'muteall:'..msg.to.id
        redis:del(hash)
          return "⏺ Mute All Has Been Disabled\n⏺ Created By @To_My_Amigos\n⏺ Our Channel @AntiSpam_TM"
  end
end
return {
   patterns = {
      '^[/!#](muteall)$',
      '^[/!#](unmuteall)$',
      '^[/!#](muteall) (.*) (.*) (.*)$',
 },
run = run,
  pre_process = pre_process
}
end
-- by @To_My_Amigos

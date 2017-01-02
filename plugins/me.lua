--Created by: @To_My_Amigos

local function run(msg, matches)
  if matches[1]:lower() == 'semat' and not is_momod(msg) then
     send_document(get_receiver(msg), "./semat/member.webp", ok_cb, false)
    return 'You Are A Member :/'
  end
   if matches[1]:lower() == 'semat' and is_sudo(msg) then
     send_document(get_receiver(msg), "./semat/sudo.webp", ok_cb, false)
    return 'You Are My Sudo ;)'
   end
    if matches[1]:lower() == 'semat' and is_owner(msg) then
     send_document(get_receiver(msg), "./semat/owner.webp", ok_cb, false)
    return 'You Are An Owner :)'
   end
  if matches[1]:lower() == 'semat' and is_momod(msg) then
     send_document(get_receiver(msg), "./semat/momod.webp", ok_cb, false)
    return 'You Are An Admin :)'
  end
end
return {
   AntiSpam = {
"Created by: @To_My_Amigos",
"CopyRight all right reserved",
  },
  patterns = {
    "^[#!/]([Ss][Ee][Mm][Aa][Tt])$"
  }, 
  run = run 
}
--Create a folder called: semat
--Paste stickers with '.webp' format in this folder
--finish
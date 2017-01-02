local function check_member_super_deleted(cb_extra, success, result)
local receiver = cb_extra.receiver
 local msg = cb_extra.msg
  local deleted = 0 
if success == 0 then
send_large_msg(receiver, "First Set Me As An Admin\n\nCreated By @To_My_Amigos\nOur Channel @AntiSpam_TM") 
end
for k,v in pairs(result) do
  if not v.first_name and not v.last_name then
deleted = deleted + 1
 kick_user(v.peer_id,msg.to.id)
 end
 end
 send_large_msg(receiver, deleted.." Deleted Account Removed From Group\n\nCreated By @To_My_Amigos\nOur Channel @AntiSpam_TM") 
 end 
local function run(msg, matches)
if is_owner(msg) then
 local receiver = get_receiver(msg) 
channel_get_users(receiver, check_member_super_deleted,{receiver = receiver, msg = msg})
 end
 end
 return {
       patterns = {
    "^[/#!](clean deleted)$",
 },
run = run,
}

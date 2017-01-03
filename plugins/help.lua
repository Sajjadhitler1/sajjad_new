do

function run(msg, matches)
if msg.to.type == 'channel' and is_momod(msg) then
  return ''..[[

SuperGroup English Help Text With English Commands :

⚓️!block
Kicks a user from SuperGroup
			
⚓️!kick
Kicks a user from SuperGroup	
			
⚓️!who
gives you a list of members
			
⚓️!ban
Bans user from the SuperGroup
			
⚓️!unban
Unbans user from the SuperGroup
			
⚓️!id from
Get ID of user message is forwarded from
			
⚓️!promote [username|id]
Promote a SuperGroup moderator
			
⚓️!demote [username|id]
Demote a SuperGroup moderator
			
			
⚓️!setadmin [username|id]
Promote a SuperGroup admin		
			
⚓️!demoteadmin [username|id]
Demote a SuperGroup admin	
			
			
⚓️[!setname|!setphoto|!setrules|!setabout]
Sets the chat name, photo, rules, about text
			
⚓️!newlink
Generates a new group link
			
⚓️!link
Retireives the group link
			
⚓️[!lock|!unlock] [links|flood|spam|Arabic|member|rtl|sticker|contacts|strict|media|bots|fwd|reply|share|tag|number|badwords|cmd|username|all]
Lock group settings
			
			
⚓️!setflood [value]
Set [value] as flood sensitivity, Max:20 and Min:2
			
⚓️!settings
Returns chat settings
			
⚓️!mutelist
Returns mutes or mute lists for chat

⚓️[!muteuser] [reply on users msg|username|id ]
silents user

⚓️[!whitelist] [reply on users msg|username|id ]
Adds user/bot to whitelist
		
⚓️!banlist
Returns SuperGroup ban list

⚓️!rmsg [value]
delets groups message by value
			
⚓️!clean [rules|about|modlist|mutelist|deleted|whitelist]
cleans those you see
(deleted) kicks deleted accounts
			
⚓️!clear members		
Kicks All Members

⚓️!del
Deletes a message by reply
			
⚓️!public [yes|no]
Set chat visibility in pm !chats or !chatlist commands

⚓️!chats
show list of bot groups in pv
			
⚓️!broadcast [text]
send this command in PV . the bot well send your massege to all groups and supergroups

⚓️!muteall
mute's all

⚓️!muteall h m s 
muteall witn timer
h Hour(s)
m Minute(s)
s Second(s)

⚓️!chat + [text]
saves a text with its first words name
			
⚓️!chat - [text]
removes the saved text
			
⚓️!chat rm
removes all saved texts
			
⚓️!antibot [enable / disable / allow / disallow]
activating anti-bot for let then enter or not fo channels
			
SuperGroup Commands: (For memebers and moderators!)

⚓️!version
Displays a general text about the AntiSpam Cli Bot  
			
⚓️!info
Displays general info about the SuperGroup
			
⚓️!admins
Returns SuperGroup admins list
			
⚓️!owner
Returns group owner
			
⚓️!modlist
Returns Moderators list
			
⚓️!id
Return SuperGroup ID And user id
			
⚓️!kickme
Kicks user from SuperGroup
			
⚓️!note text
add a note
			
⚓️!mynote
get note
								
⚓️!rules
Retrieves the chat rules
					
⚓️!me
shows your rank
			
⚓️!dler
download files from link specialy from aparat
			
⚓️!time
shows IRAN's time and date


Created By : @To_My_Amigos

Our Channel : @AntiSpam_TM
			
]]..''

end
end
return {
AntiSpam = "https://bitbucket.org/AntiSpam99/AntiSpam_TM2",
patterns = {"^[!#/](help)$"},
run = run,
}
end


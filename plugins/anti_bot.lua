
local function isBotAllowed (userId, chatId)
  local hash = 'anti-bot:allowed:'..chatId..':'..userId
  local banned = redis:get(hash)
  return banned
end

local function allowBot (userId, chatId)
  local hash = 'anti-bot:allowed:'..chatId..':'..userId
  redis:set(hash, true)
end

local function disallowBot (userId, chatId)
  local hash = 'anti-bot:allowed:'..chatId..':'..userId
  redis:del(hash)
end

-- Is anti-bot enabled on chat
local function isAntiBotEnabled (chatId)
  local hash = 'anti-bot:enabled:'..chatId
  local enabled = redis:get(hash)
  return enabled
end

local function enableAntiBot (chatId)
  local hash = 'anti-bot:enabled:'..chatId
  redis:set(hash, true)
end

local function disableAntiBot (chatId)
  local hash = 'anti-bot:enabled:'..chatId
  redis:del(hash)
end

local function isABot (user)
  -- Flag its a bot 0001000000000000
  local binFlagIsBot = 4096
  local result = bit32.band(user.flags, binFlagIsBot)
  return result == binFlagIsBot
end

local function kickUser(userId, chatId)
  local chat = 'chat#id'..chatId
  local user = 'user#id'..userId
  chat_del_user(chat, user, function (data, success, result)
    if success ~= 1 then
      print('I can\'t kick '..data.user..' but should be kicked')
    end
  end, {chat=chat, user=user})
end

local function run (msg, matches)
  -- We wont return text if is a service msg
  if matches[1] ~= 'chat_add_user' and matches[1] ~= 'chat_add_user_link' then
    if msg.to.type ~= 'chat' then
      return "Anti-Flood Works Only On Channels"
    end
  end

  local chatId = msg.to.id
  if matches[1] == 'enable' then
    enableAntiBot(chatId)
    return "Bot's Entering Is Forbidden"
  end
  if matches[1] == 'disable' then
    disableAntiBot(chatId)
    return "Bot's Entering Is Free"
  end
  if matches[1] == 'allow' then
    local userId = matches[2]
    allowBot(userId, chatId)
    return "Bot '..userId..' Allowed"
  end
  if matches[1] == 'disallow' then
    local userId = matches[2]
    disallowBot(userId, chatId)
    return "Bot '..userId..' Disallowed"
  end
  if matches[1] == 'chat_add_user' or matches[1] == 'chat_add_user_link' then
    local user = msg.action.user or msg.from
    if isABot(user) then
      print('It\'s A Bot!')
      if isAntiBotEnabled(chatId) then
        print("Anti Bot Is Enabled")
        local userId = user.id
        if not isBotAllowed(userId, chatId) then
          kickUser(userId, chatId)
        else
          print("This Bot Is Allowed")
        end
      end
    end
  end
end

return {
  description = 'When bot enters group kick it.',
  usage = {
    '!antibot enable: Enable Anti-bot on current chat',
    '!antibot disable: Disable Anti-bot on current chat',
    '!antibot allow <botId>: Allow <botId> on this chat',
    '!antibot disallow <botId>: Disallow <botId> on this chat'
  },
  patterns = {
    '^!antibot (allow) (%d+)$',
    '^!antibot (disallow) (%d+)$',
    '^!antibot (enable)$',
    '^!antibot (disable)$',
    '^!!tgservice (chat_add_user)$',
    '^!!tgservice (chat_add_user_link)$'
  },
  run = run
} 

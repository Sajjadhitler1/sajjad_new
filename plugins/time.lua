function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No Connection" end
local jdat = json:decode(url)
local text = 'IRAN Time :\n'..jdat.FAtime..'\nToday Is :\n'..jdat.FAdate..'\n--------\nTime '..jdat.ENtime..'\n'..jdat.ENdate.. '\nCreated By @To_My_Amigos\nOur Channel @AntiSpam_TM'
return text
end
return {
  patterns = {"^[/!#]([Tt][iI][Mm][Ee])$"}, 
run = run 
}
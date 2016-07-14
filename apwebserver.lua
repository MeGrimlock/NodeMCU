srv=net.createServer(net.TCP)   --make http server
srv:listen(80,function(conn) 
    conn:on("receive",function(conn,payload) 
    print("payload "..payload) 
    conn:send("<h1> format is 192.168.2.1/ssid=(yourssid)&pass=(yourpass)!<br><br>Don't forget the exclamation!!!!</h1>")
    if string.find(payload,"ssid=") then
    local startssid
    startssid = string.find(payload, "ssid=") + 5 
    local endssid  = string.find(payload, "&pass=") - 1
    newssid = string.sub(payload, startssid, endssid)  --look for ssid in http call
    print("newssid "..newssid)  --prints to serial, for testing mostly
    end
    if string.find(payload,"pass=") then
        local startpass
    startpass = string.find(payload, "pass=") + 5
        local endpass  = string.find(payload, "!") - 1 
        newpass = string.sub(payload, startpass, endpass)  --look for password in http call
        print("newpass "..newpass)  --prints to serial, for testing
        srv:close()
        wifi.setmode(wifi.STATION)  --switch to station mode
        wifi.sta.config(newssid, newpass)   --set new ssid and pass
        tmr.alarm(1,20000,0, function() dofile("main.lua") end)  --let new ssid and pass take effect before going back
       end
    end) 
end)
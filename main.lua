if wifi.sta.getip() == nil then
    wifi.setmode(wifi.SOFTAP)
    cfg={}
    cfg.ssid=ssid
    cfg.pwd=pass
    wifi.ap.config(cfg)  --setup ap
    dofile("apwebserver.lua")
else
  --run your regular project
end
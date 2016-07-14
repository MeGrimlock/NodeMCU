wifi.setmode(wifi.SOFTAP)
wifi.ap.config({
    ssid = 'myssid',
    pwd = '12345678'
})
wifi.ap.dhcp.start()  -- important!
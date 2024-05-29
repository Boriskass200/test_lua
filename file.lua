local component = require("component")
local event = require("event")
local modem = component.modem

local NetworkPort = tonumber((...))

function openServer(port)
  print("Startup server at port: "..port)
  modem.open(port)
end

function listening()
  print("listen")
  while true do
    local ev, pc1, pc2, port, wtf, msg = event.pull(3, "modem_message")
    if ev == "modem_message" then
      print("message: "..msg.." Sender: "..pc2)
    end
  end
end

openServer(NetworkPort)
listening()

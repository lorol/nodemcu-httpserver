local function sendHeader(connection)
   connection:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\Cache-Control: private, no-store\r\n\r\n")
end

local function sendFileList(connection)
   connection:send("<ul>\n")
   local l = file.list()
   for name, size in pairs(l) do
      connection:send("   <li>" .. name .. " (" .. size .. ")</li>\n")
   end
   connection:send("</ul>\n")
end

return function (connection, args)
   sendHeader(connection)
   connection:send('<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><title>A Lua script sample</title></head>')
   connection:send('<body>')
   connection:send('<h1>File Listing</h1>')
   sendFileList(connection)
   connection:send('</body></html>')
end

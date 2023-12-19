#!/bin/sh

# Install ultraviolet-static if not already installed
if ! command -v uvs &> /dev/null; then
  npm install -g ultraviolet-static
fi

# Create a new ultraviolet-static project
uvs create Roblox_Unblocked

# Configure the project
mv Roblox_Unblocked/uvs.json Roblox_Unblocked/uvs.json.backup
echo '{"name":"Roblox Unblocked","version":"1.0.0","proxy":true,"routes":{ "/": { "target": "https://now.gg/apps/roblox-corporation/5349/roblox.html", "changeOrigin": true } }}' > Roblox_Unblocked/uvs.json

# Implement the proxy server
mv Roblox_Unblocked/server.js Roblox_Unblocked/server.js.backup
echo 'const { createProxyServer } = require("ultraviolet-static");

const server = createProxyServer({
  uvs: {
    name: "Roblox Unblocked",
    version: "1.0.0",
    proxy: true,
    routes: {
      "/": {
        target: "https://now.gg/apps/roblox-corporation/5349/roblox.html",
        changeOrigin: true,
      },
    },
  },
  logger: {
    level: "info",
  },
});

server.listen(3000, "0.0.0.0", () => {
  console.log("Proxy server is running at http://localhost:3000");
});' > Roblox_Unblocked/server.js

# Make the setup script executable
chmod +x setup.sh

# Run the setup script
./setup.sh

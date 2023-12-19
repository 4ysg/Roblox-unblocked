const { createProxyServer } = require('ultraviolet-static');

const server = createProxyServer({
  uvs: {
    name: 'Roblox Unblocked',
    version: '1.0.0',
    proxy: true,
    routes: {
      '/': {
        target: 'https://now.gg/apps/roblox-corporation/5349/roblox.html',
        changeOrigin: true,
      },
    },
  },
  logger: {
    level: 'info',
  },
});

server.listen(3000, '0.0.0.0', () => {
  console.log('Proxy server is running at http://localhost:3000');
});

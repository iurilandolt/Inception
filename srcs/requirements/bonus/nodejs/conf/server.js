const http = require('http');
const fs = require('fs');

const server = http.createServer((req, res) => {
	fs.readFile('/app/public/index.html', (err, content) => {
		if (err) {

			res.writeHead(500, { 'Content-Type': 'text/html' });
			res.end('Server Error: Unable to load the page');
		} else {

			res.writeHead(200, { 'Content-Type': 'text/html' });
			res.end(content, 'utf8');
		}
	});
});

const PORT = 3000;
server.listen(PORT, () => {
	console.log(`Server is running on http://localhost:${PORT}`);
});
const http = require('http');
const fs = require('fs');
const path = require('path');

const server = http.createServer((req, res) => {
	console.log(`Received request for ${req.url}`);

	let filePath = path.resolve('/app/public' + (req.url === '/' ? '/index.html' : req.url.split('?')[0]));
	const extname = path.extname(filePath);

	let contentType = 'text/html';
	// if (extname === '.css') contentType = 'text/css';
	// else if (extname === '.js') contentType = 'application/javascript';

	fs.readFile(filePath, (err, content) => {
		if (err) {
			if (err.code === 'ENOENT') {
				fs.readFile(path.resolve('/app/public/404.html'), (error, content404) => {
					res.writeHead(404, { 'Content-Type': 'text/html' });
					res.end(content404 || '404 Nothing to see here', 'utf8');
				});
			} else {
				res.writeHead(500);
				res.end(`Server Error: ${err.code}`);
			}
		} else {
			res.writeHead(200, { 'Content-Type': contentType });
			res.end(content, 'utf8');
		}
	});
});

const PORT = 3000;
server.listen(PORT, () => {
	console.log(`Server is running on http://localhost:${PORT}`);
});


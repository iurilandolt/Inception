const http = require('http');
const fs = require('fs');
const path = require('path');

const server = http.createServer((req, res) => {
	// Set the base file path
	let filePath = path.join(__dirname, 'public', req.url === '/' ? 'index.html' : req.url);

	// Get the file extension
	let extname = path.extname(filePath);

	// Set the content type based on the file extension
	let contentType = 'text/html';
	switch (extname) {
		case '.js':
			contentType = 'text/javascript';
			break;
		case '.css':
			contentType = 'text/css';
			break;
		case '.json':
			contentType = 'application/json';
			break;
		case '.png':
			contentType = 'image/png';
			break;
		case '.jpg':
			contentType = 'image/jpg';
			break;
	}

	// Read the file and serve it
	fs.readFile(filePath, (err, content) => {
		if (err) {
			if (err.code == 'ENOENT') {
				// File not found
				fs.readFile(path.join(__dirname, 'public', '404.html'), (err, content) => {
					res.writeHead(404, { 'Content-Type': 'text/html' });
					res.end(content, 'utf8');
				});
			} else {
				// Some server error
				res.writeHead(500);
				res.end(`Server Error: ${err.code}`);
			}
		} else {
			// Success
			res.writeHead(200, { 'Content-Type': contentType });
			res.end(content, 'utf8');
		}
	});
});

const PORT = 3000;
server.listen(PORT, () => {
	console.log(`Server is running on http://localhost:${PORT}`);
});
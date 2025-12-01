const fs = require('fs');
const path = require('path');

exports.handler = async () => {
    const html = fs.readFileSync(path.join(__dirname, '../index.html'), 'utf8');

    return {
        statusCode: 200,
        headers: { "Content-Type": "text/html" },
        body: html
    };
};

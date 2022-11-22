const express = require('express');
const gracefulShutdown = require('http-graceful-shutdown');

const app = express();
const port = 3000;

app.get('/', (_, res) => {
    res.send('Hello Docker!');
});

gracefulShutdown(
    app.listen(port, () => {
        console.log(`App listening on port ${port}`);
    }),
);

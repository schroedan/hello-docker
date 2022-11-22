const dateFormat = require('date-format');
const express = require('express');
const gracefulShutdown = require('http-graceful-shutdown');
const redisCache = require('express-redis-cache');

const app = express();
const cache = redisCache({ host: 'redis' });
const port = 3000;

app.get('/', cache.route({ expire: 10 }), (_, res) => {
    res.send(
        `Hello Docker! It is ${dateFormat.asString('hh:mm:ss', new Date())}.`,
    );
});

gracefulShutdown(
    app.listen(port, () => {
        console.log(`App listening on port ${port}`);
    }),
);

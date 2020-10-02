const express = require('express');
const {createProxyMiddleware} = require('http-proxy-middleware');

const app = express();

app.use('/socket.io/**', createProxyMiddleware({
    target: process.env.SERVER_SIO || 'http://socket:8000',
    changeOrigin: false,
    logLevel: "debug",
    ws: true
}));

app.use('/', createProxyMiddleware({
    target: process.env.SERVER_WEB || 'http://web:8000',
    changeOrigin: false,
    logLevel: "debug"
}));

app.listen(8080, "0.0.0.0");

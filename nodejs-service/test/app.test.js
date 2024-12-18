const request = require('supertest');
const express = require('express');

const app = express();
app.get('/', (req, res) => res.json({ message: 'Hello from Node.js Service!' }));

test('should return Hello message', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toBe(200);
    expect(res.body.message).toBe('Hello from Node.js Service!');
});
